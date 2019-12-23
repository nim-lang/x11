import x, xlib, xi

const xNeedWidePrototypes {.booldefine.} = defined(posix)

const
  deviceKeyPress* = 0
  deviceKeyRelease* = 1
  deviceButtonPress* = 0
  deviceButtonRelease* = 1
  deviceMotionNotify* = 0
  deviceFocusIn* = 0
  deviceFocusOut* = 1
  proximityIn* = 0
  proximityOut* = 1
  deviceStateNotify* = 0
  deviceMappingNotify* = 1
  changeDeviceNotify* = 2

  propertyNotify* = 6

template FindTypeAndClass*(d, `type`, class, classid, offset: untyped) =
  var i: cint
  var ip: PXInputClassInfo
  `type` = 0
  class = 0
  i = 0
  ip = (cast[PXDevice](d)).classes
  while i < (cast[PXDevice](d)).num_classes:
    if ip.input_class == classid:
      `type` = ip.event_type_base + offset
      class = (cast[PXDevice](d)).device_id shl 8 or `type`
    inc(i)
    inc(ip)

template DeviceKeyPress*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, KeyClass, deviceKeyPress)

template DeviceKeyRelease*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, KeyClass, deviceKeyRelease)

template DeviceButtonPress*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, ButtonClass, deviceButtonPress)

template DeviceButtonRelease*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, ButtonClass, deviceButtonRelease)

template DeviceMotionNotify*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, ValuatorClass, deviceMotionNotify)

template DeviceFocusIn*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, FocusClass, deviceFocusIn)

template DeviceFocusOut*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, FocusClass, deviceFocusOut)

template ProximityIn*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, ProximityClass, proximityIn)

template ProximityOut*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, ProximityClass, proximityOut)

template DeviceStateNotify*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, OtherClass, deviceStateNotify)

template DeviceMappingNotify*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, OtherClass, deviceMappingNotify)

template ChangeDeviceNotify*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, OtherClass, changeDeviceNotify)

template DevicePropertyNotify*(d, `type`, class: untyped): untyped =
  FindTypeAndClass(d, `type`, class, OtherClass, propertyNotify)

template DevicePointerMotionHint*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or devicePointerMotionHint

template DeviceButton1Motion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButton1Motion

template DeviceButton2Motion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButton2Motion

template DeviceButton3Motion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButton3Motion

template DeviceButton4Motion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButton4Motion

template DeviceButton5Motion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButton5Motion

template DeviceButtonMotion*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButtonMotion

template DeviceOwnerGrabButton*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceOwnerGrabButton

template DeviceButtonPressGrab*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or deviceButtonGrab

template NoExtensionEvent*(d, `type`, class: untyped) =
  class = (cast[PXDevice](d)).device_id shl 8 or noExtensionEvent

template DevicePresence*(dpy, `type`, class: untyped) =
  `type` = XiGetDevicePresenceNotifyEvent(dpy)
  class = (0x00010000 or devicePresence)

##  Errors

template BadDevice*(dpy, error: untyped): untyped =
  xibaddevice(dpy, addr(error))

template BadClass*(dpy, error: untyped): untyped =
  xibadclass(dpy, addr(error))

template BadEvent*(dpy, error: untyped): untyped =
  xibadevent(dpy, addr(error))

template BadMode*(dpy, error: untyped): untyped =
  xibadmode(dpy, addr(error))

template DeviceBusy*(dpy, error: untyped): untyped =
  xidevicebusy(dpy, addr(error))

type
  PXDeviceKeyEvent* = ptr TXDeviceKeyEvent
  TXDeviceKeyEvent* {.final.} = object
    ##  DeviceKey events.  These events are sent by input devices that
    ##  support input class Keys.
    ##  The location of the X pointer is reported in the coordinate
    ##  fields of the x,y and x_root,y_root fields.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed
    send_event*: TBool          ##  true if from SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  "event" window reported relative to
    deviceid*: TXID
    root*: TWindow              ##  root window event occured on
    subwindow*: TWindow         ##  child window
    time*: TTime                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    keycode*: cuint            ##  detail
    same_screen*: TBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceKeyPressedEvent* = PXDeviceKeyEvent
  TXDeviceKeyPressedEvent* = TXDeviceKeyEvent

  PXDeviceKeyReleasedEvent* = PXDeviceKeyEvent
  TXDeviceKeyReleasedEvent* = TXDeviceKeyEvent

  PXDeviceButtonEvent* = ptr TXDeviceButtonEvent
  TXDeviceButtonEvent* {.final.} = object
    ##  DeviceButton events.  These events are sent by extension devices
    ##  that support input class Buttons.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  "event" window reported relative to
    deviceid*: TXID
    root*: TWindow              ##  root window that the event occured on
    subwindow*: TWindow         ##  child window
    time*: TTime                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    button*: cuint             ##  detail
    same_screen*: TBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceButtonPressedEvent* = PXDeviceButtonEvent
  TXDeviceButtonPressedEvent* = TXDeviceButtonEvent

  PXDeviceButtonReleasedEvent* = PXDeviceButtonEvent
  TXDeviceButtonReleasedEvent* = TXDeviceButtonEvent

  PXDeviceMotionEvent* = ptr TXDeviceMotionEvent
  TXDeviceMotionEvent* {.final.} = object
    ##  DeviceMotionNotify event.  These events are sent by extension devices
    ##  that support input class Valuators.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  "event" window reported relative to
    deviceid*: TXID
    root*: TWindow              ##  root window that the event occured on
    subwindow*: TWindow         ##  child window
    time*: TTime                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    is_hint*: char             ##  detail
    same_screen*: TBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceFocusChangeEvent* = ptr TXDeviceFocusChangeEvent
  TXDeviceFocusChangeEvent* {.final.} = object
    ##  DeviceFocusChange events.  These events are sent when the focus
    ##  of an extension device that can be focused is changed.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  "event" window reported relative to
    deviceid*: TXID
    mode*: cint                ##  NotifyNormal, NotifyGrab, NotifyUngrab
    detail*: cint ##
                ##  NotifyAncestor, NotifyVirtual, NotifyInferior,
                ##  NotifyNonLinear,NotifyNonLinearVirtual, NotifyPointer,
                ##  NotifyPointerRoot, NotifyDetailNone
                ##
    time*: TTime

  PXDeviceFocusInEvent* = PXDeviceFocusChangeEvent
  TXDeviceFocusInEvent* = TXDeviceFocusChangeEvent

  PXDeviceFocusOutEvent* = PXDeviceFocusChangeEvent
  TXDeviceFocusOutEvent* = TXDeviceFocusChangeEvent

  PXProximityNotifyEvent* = ptr TXProximityNotifyEvent
  TXProximityNotifyEvent* {.final.} = object
    ##  ProximityNotify events.  These events are sent by those absolute
    ##  positioning devices that are capable of generating proximity information.
    `type`*: cint              ##  ProximityIn or ProximityOut
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow
    deviceid*: TXID
    root*: TWindow
    subwindow*: TWindow
    time*: TTime
    x*: cint
    y*: cint
    x_root*: cint
    y_root*: cint
    state*: cuint
    same_screen*: TBool
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXProximityInEvent* = PXProximityNotifyEvent
  TXProximityInEvent* = TXProximityNotifyEvent

  PXProximityOutEvent* = PXProximityNotifyEvent
  TXProximityOutEvent* = TXProximityNotifyEvent

  PXInputClass* = ptr TXInputClass
  TXInputClass* {.final.} = object
    class*: cuchar
    length*: cuchar

  PXDeviceStateNotifyEvent* = ptr TXDeviceStateNotifyEvent
  TXDeviceStateNotifyEvent* {.final.} = object
    ##  DeviceStateNotify events are generated on TEnterWindow and FocusIn
    ##  for those clients who have selected DeviceState.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow
    deviceid*: TXID
    time*: TTime
    num_classes*: cint
    data*: array[64, char]

  PXValuatorStatus* = ptr TXValuatorStatus
  TXValuatorStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_valuators*: cuchar
    mode*: cuchar
    valuators*: array[6, cint]

  PXKeyStatus* = ptr TXKeyStatus
  TXKeyStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_keys*: cshort
    keys*: array[32, char]

  PXButtonStatus* = ptr TXButtonStatus
  TXButtonStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_buttons*: cshort
    buttons*: array[32, char]

  PXDeviceMappingEvent* = ptr TXDeviceMappingEvent
  TXDeviceMappingEvent* {.final.} = object
    ##  DeviceMappingNotify event.  This event is sent when the key mapping,
    ##  modifier mapping, or button mapping of an extension device is changed.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  unused
    deviceid*: TXID
    time*: TTime
    request*: cint             ##  one of MappingModifier, MappingKeyboard,
                 ##                                     MappingPointer
    first_keycode*: cint       ##  first keycode
    count*: cint               ##  defines range of change w. first_keycode

  PXChangeDeviceNotifyEvent* = ptr TXChangeDeviceNotifyEvent
  TXChangeDeviceNotifyEvent* {.final.} = object
    ##  ChangeDeviceNotify event.  This event is sent when an
    ##  XChangeKeyboard or XChangePointer request is made.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  unused
    deviceid*: TXID
    time*: TTime
    request*: cint             ##  NewPointer or NewKeyboard

  PXDevicePresenceNotifyEvent* = ptr TXDevicePresenceNotifyEvent
  TXDevicePresenceNotifyEvent* {.final.} = object
    ##  DevicePresenceNotify event.  This event is sent when the list of
    ##  input devices changes, in which case devchange will be false, and
    ##  no information about the change will be contained in the event;
    ##  the client should use XListInputDevices() to learn what has changed.
    ##
    ##  If devchange is true, an attribute that the server believes is
    ##  important has changed on a device, and the client should use
    ##  XGetDeviceControl to examine the device.  If control is non-zero,
    ##  then that control has changed meaningfully.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  unused
    time*: TTime
    devchange*: TBool
    deviceid*: TXID
    control*: TXID

  PXDevicePropertyNotifyEvent* = ptr TXDevicePropertyNotifyEvent
  TXDevicePropertyNotifyEvent* {.final.} = object
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: TBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: TWindow            ##  unused
    time*: TTime
    deviceid*: TXID             ##  id of the device that changed
    atom*: TAtom                ##  the property that changed
    state*: cint               ##  PropertyNewValue or PropertyDeleted

  PXFeedbackState* = ptr TXFeedbackState
  TXFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID

  PXKbdFeedbackState* = ptr TXKbdFeedbackState
  TXKbdFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    click*: cint
    percent*: cint
    pitch*: cint
    duration*: cint
    led_mask*: cint
    global_auto_repeat*: cint
    auto_repeats*: array[32, char]

  PXPtrFeedbackState* = ptr TXPtrFeedbackState
  TXPtrFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    accelNum*: cint
    accelDenom*: cint
    threshold*: cint

  PXIntegerFeedbackState* = ptr TXIntegerFeedbackState
  TXIntegerFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    resolution*: cint
    minVal*: cint
    maxVal*: cint

  PXStringFeedbackState* = ptr TXStringFeedbackState
  TXStringFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    max_symbols*: cint
    num_syms_supported*: cint
    syms_supported*: PKeySym

  PXBellFeedbackState* = ptr TXBellFeedbackState
  TXBellFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    percent*: cint
    pitch*: cint
    duration*: cint

  PXLedFeedbackState* = ptr TXLedFeedbackState
  TXLedFeedbackState* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    led_values*: cint
    led_mask*: cint

  PXFeedbackControl* = ptr TXFeedbackControl
  TXFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID

  PXPtrFeedbackControl* = ptr TXPtrFeedbackControl
  TXPtrFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    accelNum*: cint
    accelDenom*: cint
    threshold*: cint

  PXKbdFeedbackControl* = ptr TXKbdFeedbackControl
  TXKbdFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    click*: cint
    percent*: cint
    pitch*: cint
    duration*: cint
    led_mask*: cint
    led_value*: cint
    key*: cint
    auto_repeat_mode*: cint

  PXStringFeedbackControl* = ptr TXStringFeedbackControl
  TXStringFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    num_keysyms*: cint
    syms_to_display*: PKeySym

  PXIntegerFeedbackControl* = ptr TXIntegerFeedbackControl
  TXIntegerFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    int_to_display*: cint

  PXBellFeedbackControl* = ptr TXBellFeedbackControl
  TXBellFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    percent*: cint
    pitch*: cint
    duration*: cint

  PXLedFeedbackControl* = ptr TXLedFeedbackControl
  TXLedFeedbackControl* {.final.} = object
    class*: TXID
    length*: cint
    id*: TXID
    led_mask*: cint
    led_values*: cint

  PXDeviceControl* = ptr TXDeviceControl
  TXDeviceControl* {.final.} = object
    control*: TXID
    length*: cint

  PXDeviceResolutionControl* = ptr TXDeviceResolutionControl
  TXDeviceResolutionControl* {.final.} = object
    control*: TXID
    length*: cint
    first_valuator*: cint
    num_valuators*: cint
    resolutions*: ptr cint

  PXDeviceResolutionState* = ptr TXDeviceResolutionState
  TXDeviceResolutionState* {.final.} = object
    control*: TXID
    length*: cint
    num_valuators*: cint
    resolutions*: ptr cint
    min_resolutions*: ptr cint
    max_resolutions*: ptr cint

  PXDeviceAbsCalibControl* = ptr TXDeviceAbsCalibControl
  TXDeviceAbsCalibControl* {.final.} = object
    control*: TXID
    length*: cint
    min_x*: cint
    max_x*: cint
    min_y*: cint
    max_y*: cint
    flip_x*: cint
    flip_y*: cint
    rotation*: cint
    button_threshold*: cint

  PXDeviceAbsCalibState* = PXDeviceAbsCalibControl
  TXDeviceAbsCalibState* = TXDeviceAbsCalibControl

  PXDeviceAbsAreaControl* = ptr TXDeviceAbsAreaControl
  TXDeviceAbsAreaControl* {.final.} = object
    control*: TXID
    length*: cint
    offset_x*: cint
    offset_y*: cint
    width*: cint
    height*: cint
    screen*: cint
    following*: TXID

  PXDeviceAbsAreaState* = PXDeviceAbsAreaControl
  TXDeviceAbsAreaState* = TXDeviceAbsAreaControl

  PXDeviceCoreControl* = ptr TXDeviceCoreControl
  TXDeviceCoreControl* {.final.} = object
    control*: TXID
    length*: cint
    status*: cint

  PXDeviceCoreState* = ptr TXDeviceCoreState
  TXDeviceCoreState* {.final.} = object
    control*: TXID
    length*: cint
    status*: cint
    iscore*: cint

  PXDeviceEnableControl* = ptr TXDeviceEnableControl
  TXDeviceEnableControl* {.final.} = object
    control*: TXID
    length*: cint
    enable*: cint

  PXDeviceEnableState* = PXDeviceEnableControl
  TXDeviceEnableState* = TXDeviceEnableControl

  PXAnyClassInfo* = ptr TXAnyClassInfo
  TXAnyClassInfo* {.final.} = object
    class*: TXID
    length*: cint

  PXDeviceInfo* = ptr TXDeviceInfo
  TXDeviceInfo* {.final.} = object
    id*: TXID
    `type`*: TAtom
    name*: cstring
    num_classes*: cint
    use*: cint
    inputclassinfo*: PXAnyClassInfo

  PXKeyInfo* = ptr TXKeyInfo
  TXKeyInfo* {.final.} = object
    class*: TXID
    length*: cint
    min_keycode*: cushort
    max_keycode*: cushort
    num_keys*: cushort

  PXButtonInfo* = ptr TXButtonInfo
  TXButtonInfo* {.final.} = object
    class*: TXID
    length*: cint
    num_buttons*: cshort

  PXAxisInfo* = ptr TXAxisInfo
  TXAxisInfo* {.final.} = object
    resolution*: cint
    min_value*: cint
    max_value*: cint

  PXValuatorInfo* = ptr TXValuatorInfo
  TXValuatorInfo* {.final.} = object
    class*: TXID
    length*: cint
    num_axes*: cuchar
    mode*: cuchar
    motion_buffer*: culong
    axes*: PXAxisInfo

  PXInputClassInfo* = ptr TXInputClassInfo
  TXInputClassInfo* {.final.} = object
    input_class*: cuchar
    event_type_base*: cuchar

  PXDevice* = ptr TXDevice
  TXDevice* {.final.} = object
    device_id*: TXID
    num_classes*: cint
    classes*: PXInputClassInfo

  PXEventList* = ptr TXEventList
  TXEventList* {.final.} = object
    event_type*: XEventClass
    device*: TXID

  PXDeviceTimeCoord* = ptr TXDeviceTimeCoord
  TXDeviceTimeCoord* {.final.} = object
    time*: TTime
    data*: ptr cint

  PXDeviceState* = ptr TXDeviceState
  TXDeviceState* {.final.} = object
    device_id*: TXID
    num_classes*: cint
    data*: PXInputClass

  PXValuatorState* = ptr TXValuatorState
  TXValuatorState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_valuators*: cuchar
    mode*: cuchar
    valuators*: ptr cint

  PXKeyState* = ptr TXKeyState
  TXKeyState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_keys*: cshort
    keys*: array[32, char]

  PXButtonState* = ptr TXButtonState
  TXButtonState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_buttons*: cshort
    buttons*: array[32, char]

{.push cdecl, importc, dynlib: libXi.}

proc XChangeKeyboardDevice*(a1: PDisplay, a2: PXDevice): cint
proc XChangePointerDevice*(a1: PDisplay, a2: PXDevice, a3, a4: cint): cint
proc XGrabDevice*(a1: PDisplay, a2: PXDevice, a3: TWindow, a4: TBool, a5: cint,
                 a6: ptr UncheckedArray[XEventClass], a7, a8: cint, a9: TTime): cint
proc XUngrabDevice*(a1: PDisplay, a2: PXDevice, a3: TTime): cint
proc XGrabDeviceKey*(a1: PDisplay, a2: PXDevice, a3, a4: cuint,
                    a5: PXDevice, a6: TWindow, a7: TBool, a8: cuint,
                    a9: ptr UncheckedArray[XEventClass], a10, a11: cint): cint
proc XUngrabDeviceKey*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                      a5: PXDevice, a6: TWindow): cint
proc XGrabDeviceButton*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                       a5: PXDevice, a6: TWindow, a7: TBool, a8: cuint,
                       a9: ptr UncheckedArray[XEventClass], a10: cint, a11: cint): cint
proc XUngrabDeviceButton*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                         a5: PXDevice, a6: TWindow): cint
proc XAllowDeviceEvents*(a1: PDisplay, a2: PXDevice, a3: cint, a4: TTime): cint
proc XGetDeviceFocus*(a1: PDisplay, a2: PXDevice, a3: PWindow, a4: ptr cint,
                     a5: ptr TTime): cint
proc XSetDeviceFocus*(a1: PDisplay, a2: PXDevice, a3: TWindow, a4: cint, a5: TTime): cint
proc XGetFeedbackControl*(a1: PDisplay, a2: PXDevice, a3: ptr cint): PXFeedbackState
proc XFreeFeedbackList*(a1: PXFeedbackState)
proc XChangeFeedbackControl*(a1: PDisplay, a2: PXDevice, a3: culong,
                            a4: PXFeedbackControl): cint
proc XDeviceBell*(a1: PDisplay, a2: PXDevice, a3, a4: TXID, a5: cint): cint
proc XGetDeviceKeyMapping*(a1: PDisplay, a2: PXDevice,
  a3: (when xNeedWidePrototypes: cuint else: TKeyCode),
  a4: cint, a5: ptr cint): PKeySym
proc XChangeDeviceKeyMapping*(a1: PDisplay, a2: PXDevice, a3: cint, a4: cint,
                             a5: PKeySym, a6: cint): cint
proc XGetDeviceModifierMapping*(a1: PDisplay, a2: PXDevice): PXModifierKeymap
proc XSetDeviceModifierMapping*(a1: PDisplay, a2: PXDevice,
                               a3: PXModifierKeymap): cint
proc XSetDeviceButtonMapping*(a1: PDisplay, a2: PXDevice, a3: cstring, a4: cint): cint
proc XGetDeviceButtonMapping*(a1: PDisplay, a2: PXDevice, a3: cstring, a4: cuint): cint
proc XQueryDeviceState*(a1: PDisplay, a2: PXDevice): PXDeviceState
proc XFreeDeviceState*(a1: PXDeviceState)
proc XGetExtensionVersion*(a1: PDisplay, a2: cstring): PXExtensionVersion
proc XListInputDevices*(a1: PDisplay, a2: ptr cint): PXDeviceInfo
proc XFreeDeviceList*(a1: PXDeviceInfo)
proc XOpenDevice*(a1: PDisplay, a2: TXID): PXDevice
proc XCloseDevice*(a1: PDisplay, a2: PXDevice): cint
proc XSetDeviceMode*(a1: PDisplay, a2: PXDevice, a3: cint): cint
proc XSetDeviceValuators*(a1: PDisplay, a2: PXDevice, a3: ptr cint, a4: cint, a5: cint): cint
proc XGetDeviceControl*(a1: PDisplay, a2: PXDevice, a3: cint): PXDeviceControl
proc XChangeDeviceControl*(a1: PDisplay, a2: PXDevice, a3: cint,
                          a4: PXDeviceControl): cint
proc XSelectExtensionEvent*(a1: PDisplay, a2: TWindow, a3: ptr UncheckedArray[XEventClass], a4: cint): cint
proc XGetSelectedExtensionEvents*(a1: PDisplay, a2: TWindow, a3: ptr cint,
                                 a4: ptr ptr UncheckedArray[XEventClass], a5: ptr cint,
                                 a6: ptr ptr UncheckedArray[XEventClass]): cint
proc XChangeDeviceDontPropagateList*(a1: PDisplay, a2: TWindow, a3: cint,
                                    a4: ptr UncheckedArray[XEventClass], a5: cint): cint
proc XGetDeviceDontPropagateList*(a1: PDisplay, a2: TWindow, a3: ptr cint): ptr UncheckedArray[XEventClass]
proc XSendExtensionEvent*(a1: PDisplay, a2: PXDevice, a3: TWindow, a4: TBool, a5: cint,
                         a6: ptr UncheckedArray[XEventClass], a7: PXEvent): TStatus
proc XGetDeviceMotionEvents*(a1: PDisplay, a2: PXDevice, a3, a4: TTime,
                            a5, a6, a7: ptr cint): PXDeviceTimeCoord
proc XFreeDeviceMotionEvents*(a1: PXDeviceTimeCoord)
proc XFreeDeviceControl*(a1: PXDeviceControl)
proc XListDeviceProperties*(a1: PDisplay, a2: PXDevice, a3: ptr cint): PAtom
proc XChangeDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: TAtom, a4: TAtom, a5: cint,
                           a6: cint, a7: cstring, a8: cint)
proc XDeleteDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: TAtom)
proc XGetDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: TAtom, a4, a5: clong,
                        a6: TBool, a7: TAtom, a8: PAtom, a9: ptr cint, a10: ptr culong,
                        a11: ptr culong, a12: ptr cstring): TStatus

{.pop.}
