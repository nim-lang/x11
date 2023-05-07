import
  x11/xlib,
  x11/xutil,
  x11/x,
  x11/xi2,
  x11/xinput2

const
  windowWidth = 1000
  windowHeight = 600
  borderWidth = 5
  eventMask = ButtonPressMask or KeyPressMask or ExposureMask

type
  GUIDeviceFlags = enum
    devStylus, devEraser
  GUIDevice = object
    id: int32
    # Attributes of Device
    flags: set[GUIDeviceFlags]
    # Pressure Information
    pmin, pmax, plast: float
    # Number Information
    btn_num, pnum: int32

var
  display: PDisplay
  window: Window
  deleteMessage: Atom
  graphicsContext: GC
  # XInput2 Stuff
  xi_opcode: int32
  # Device List
  devices: seq[GUIDevice]

proc init() =
  display = XOpenDisplay(nil)
  if display == nil:
    quit "Failed to open display"

  var aux: int32
  # Query XInput2 Extension
  aux = XQueryExtension(display, "XInputExtension", 
    addr xi_opcode, addr aux, addr aux)
  if aux == 0:
    quit "Failed to load XInput Extension"

  # Check if is XInput2
  var 
    major = int32(2)
    minor = int32(3)
  aux = XIQueryVersion(display, 
    addr major, addr minor)
  if aux != Success:
    quit "XInput Extension is not XInput2"

  # Create Window
  let
    screen = XDefaultScreen(display)
    rootWindow = XRootWindow(display, screen)
    foregroundColor = XBlackPixel(display, screen)
    backgroundColor = XWhitePixel(display, screen)

  window = XCreateSimpleWindow(display, rootWindow, -1, -1, windowWidth,
      windowHeight, borderWidth, foregroundColor, backgroundColor)

  discard XSetStandardProperties(display, window, "XI2 Example", "window", 0,
      nil, 0, nil)
  discard XSelectInput(display, window, eventMask)
  discard XMapWindow(display, window)

  block: # Select XI2 Devices
    var 
      device_n: int32
      device: PXIDeviceInfo
      device_class: PXIAnyClassInfo
    let 
      device_list = cast[ptr UncheckedArray[XIDeviceInfo]](
        XIQueryDevice(display, XIAllDevices, addr device_n))
      # Look for Pressure Axis, Tilt will be added sometime
      p_label = XInternAtom(display, "Abs Pressure", false.XBool)
    # Iterate Each Device
    for i in 0..<device_n:
      device = addr device_list[i]
      if device.use != XISlavePointer:
        continue # Skip Not Slave Pointers
      echo device.name
      # New Device Item
      var item: GUIDevice
      # Store Device ID
      item.id = device.deviceid
      # Shortcur for Device Classes
      let device_classes = cast[ptr 
        UncheckedArray[PXIAnyClassInfo]](device.classes)
      # Get Buttons and Valuators
      for j in 0..<device.num_classes:
        device_class = device_classes[j]
        # Store Number of Buttons
        if device_class.`type` == XIButtonClass:
          item.btn_num = cast[PXIButtonClassInfo](device_class).num_buttons
        # Store Pressure Ranges
        if device_class.`type` == XIValuatorClass:
          let valuator = cast[PXIValuatorClassInfo](device_class)
          if valuator.label == p_label:
            item.pnum = valuator.number
            item.pmin = valuator.min
            item.pmax = valuator.max
      # Store New Device Item
      devices.add(item)
    # Free Device Info
    XIFreeDeviceInfo(
      cast[PXIDeviceInfo](device_list))

  block: # Enable XI2 Events
    var 
      em: XIEventMask
      mask: uint8
      # Nim Shortcut
      p_mask = addr mask
    em.deviceid = 2
    em.mask_len = 1
    em.mask = cast[ptr char](p_mask)
    # Set XInput2 Masks
    XISetMask(p_mask, XI_ButtonPress)
    XISetMask(p_mask, XI_ButtonRelease)
    XISetMask(p_mask, XI_Motion)
    # Bind To Current Display and Window
    discard XISelectEvents(display, window, addr em, 1)

  # Additional X11 Stuff
  deleteMessage = XInternAtom(display, "WM_DELETE_WINDOW", false.XBool)
  discard XSetWMProtocols(display, window, deleteMessage.addr, 1)

  graphicsContext = XDefaultGC(display, screen)


proc drawWindow() =
  const text = "XInput2 Graphics Tablet Example, see console for events information"
  discard XDrawString(display, window, graphicsContext, 10, 50, text, text.len)

proc processGeneric(ev: PXEvent) =
  let 
    dev = cast[PXIDeviceEvent](ev.xcookie.data)
    kind = dev.evtype
  # Print what kind is
  if kind == XI_Motion:
    echo "XI2 Device Motion:"
  elif kind == XI_ButtonPress:
    echo "XI2 Button Pressed:"
  elif kind == XI_ButtonRelease:
    echo "XI2 Button Released:"
  else: return
  # Print Pen Coordinates
  echo " - X: ", dev.event_x
  echo " - Y: ", dev.event_y
  # Print Pen Pressure
  block: # Lookup Pressure
    var p_dev: ptr GUIDevice
    for item in mitems(devices):
      if item.id == dev.sourceid:
        p_dev = addr item
    # Found Valid Device?
    if not isNil(p_dev):
      if XIMaskIsSet(dev.valuators.mask, p_dev.pnum) == 0:
        echo " - Pressure: not found"
      else: # Lookup Pressure
        var current: int
        for i in 0..<p_dev.pnum:
          if XIMaskIsSet(dev.valuators.mask, i) != 0:
            inc(current)
        # Get Raw Pressure
        let pressure = cast[ptr UncheckedArray[cdouble]](
          dev.valuators.values)[current]
        echo " - Raw Pressure: ", pressure
        echo " - Pressure: ", (pressure - p_dev.pmin) / (p_dev.pmax - p_dev.pmin)

proc mainLoop() =
  ## Process events until the quit event is received
  var event: XEvent
  while true:
    discard XNextEvent(display, event.addr)
    case event.theType
    of Expose:
      drawWindow()
    of ClientMessage:
      if cast[Atom](event.xclient.data.l[0]) == deleteMessage:
        break
    of KeyPress:
      let key = XLookupKeysym(cast[PXKeyEvent](event.addr), 0)
      if key != 0:
        echo "Key ", key, " pressed"
    of ButtonPressMask:
      echo "Mouse button ", event.xbutton.button, " pressed at ",
          event.xbutton.x, ",", event.xbutton.y
    of GenericEvent:
      let data = XGetEventData(display, addr event.xcookie)
      if data != 0: # Process Event if Valid
        processGeneric(addr event)
        XFreeEventData(display, addr event.xcookie)
    else:
      discard

proc main() =
  init()
  mainLoop()
  discard XDestroyWindow(display, window)
  discard XCloseDisplay(display)


main()
