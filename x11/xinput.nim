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
  PXDeviceKeyEvent* = ptr XDeviceKeyEvent
  XDeviceKeyEvent* {.final.} = object
    ##  DeviceKey events.  These events are sent by input devices that
    ##  support input class Keys.
    ##  The location of the X pointer is reported in the coordinate
    ##  fields of the x,y and x_root,y_root fields.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed
    send_event*: XBool          ##  true if from SendEvent request
    display*: PDisplay       ##  Display the event was read from
    window*: Window            ##  "event" window reported relative to
    deviceid*: XID
    root*: Window              ##  root window event occured on
    subwindow*: Window         ##  child window
    time*: Time                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    keycode*: cuint            ##  detail
    same_screen*: XBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceKeyPressedEvent* = PXDeviceKeyEvent
  XDeviceKeyPressedEvent* = XDeviceKeyEvent

  PXDeviceKeyReleasedEvent* = PXDeviceKeyEvent
  XDeviceKeyReleasedEvent* = XDeviceKeyEvent

  PXDeviceButtonEvent* = ptr XDeviceButtonEvent
  XDeviceButtonEvent* {.final.} = object
    ##  DeviceButton events.  These events are sent by extension devices
    ##  that support input class Buttons.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  "event" window reported relative to
    deviceid*: XID
    root*: Window              ##  root window that the event occured on
    subwindow*: Window         ##  child window
    time*: Time                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    button*: cuint             ##  detail
    same_screen*: XBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceButtonPressedEvent* = PXDeviceButtonEvent
  XDeviceButtonPressedEvent* = XDeviceButtonEvent

  PXDeviceButtonReleasedEvent* = PXDeviceButtonEvent
  XDeviceButtonReleasedEvent* = XDeviceButtonEvent

  PXDeviceMotionEvent* = ptr XDeviceMotionEvent
  XDeviceMotionEvent* {.final.} = object
    ##  DeviceMotionNotify event.  These events are sent by extension devices
    ##  that support input class Valuators.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  "event" window reported relative to
    deviceid*: XID
    root*: Window              ##  root window that the event occured on
    subwindow*: Window         ##  child window
    time*: Time                ##  milliseconds
    x*: cint
    y*: cint                   ##  x, y coordinates in event window
    x_root*: cint              ##  coordinates relative to root
    y_root*: cint              ##  coordinates relative to root
    state*: cuint              ##  key or button mask
    is_hint*: char             ##  detail
    same_screen*: XBool         ##  same screen flag
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXDeviceFocusChangeEvent* = ptr XDeviceFocusChangeEvent
  XDeviceFocusChangeEvent* {.final.} = object
    ##  DeviceFocusChange events.  These events are sent when the focus
    ##  of an extension device that can be focused is changed.
    `type`*: cint              ##  of event
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  "event" window reported relative to
    deviceid*: XID
    mode*: cint                ##  NotifyNormal, NotifyGrab, NotifyUngrab
    detail*: cint ##
                ##  NotifyAncestor, NotifyVirtual, NotifyInferior,
                ##  NotifyNonLinear,NotifyNonLinearVirtual, NotifyPointer,
                ##  NotifyPointerRoot, NotifyDetailNone
                ##
    time*: Time

  PXDeviceFocusInEvent* = PXDeviceFocusChangeEvent
  XDeviceFocusInEvent* = XDeviceFocusChangeEvent

  PXDeviceFocusOutEvent* = PXDeviceFocusChangeEvent
  XDeviceFocusOutEvent* = XDeviceFocusChangeEvent

  PXProximityNotifyEvent* = ptr XProximityNotifyEvent
  XProximityNotifyEvent* {.final.} = object
    ##  ProximityNotify events.  These events are sent by those absolute
    ##  positioning devices that are capable of generating proximity information.
    `type`*: cint              ##  ProximityIn or ProximityOut
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window
    deviceid*: XID
    root*: Window
    subwindow*: Window
    time*: Time
    x*: cint
    y*: cint
    x_root*: cint
    y_root*: cint
    state*: cuint
    same_screen*: XBool
    device_state*: cuint       ##  device key or button mask
    axes_count*: cuchar
    first_axis*: cuchar
    axis_data*: array[6, cint]

  PXProximityInEvent* = PXProximityNotifyEvent
  XProximityInEvent* = XProximityNotifyEvent

  PXProximityOutEvent* = PXProximityNotifyEvent
  XProximityOutEvent* = XProximityNotifyEvent

  PXInputClass* = ptr XInputClass
  XInputClass* {.final.} = object
    class*: cuchar
    length*: cuchar

  PXDeviceStateNotifyEvent* = ptr XDeviceStateNotifyEvent
  XDeviceStateNotifyEvent* {.final.} = object
    ##  DeviceStateNotify events are generated on EnterWindow and FocusIn
    ##  for those clients who have selected DeviceState.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window
    deviceid*: XID
    time*: Time
    num_classes*: cint
    data*: array[64, char]

  PXValuatorStatus* = ptr XValuatorStatus
  XValuatorStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_valuators*: cuchar
    mode*: cuchar
    valuators*: array[6, cint]

  PXKeyStatus* = ptr XKeyStatus
  XKeyStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_keys*: cshort
    keys*: array[32, char]

  PXButtonStatus* = ptr XButtonStatus
  XButtonStatus* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_buttons*: cshort
    buttons*: array[32, char]

  PXDeviceMappingEvent* = ptr XDeviceMappingEvent
  XDeviceMappingEvent* {.final.} = object
    ##  DeviceMappingNotify event.  This event is sent when the key mapping,
    ##  modifier mapping, or button mapping of an extension device is changed.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  unused
    deviceid*: XID
    time*: Time
    request*: cint             ##  one of MappingModifier, MappingKeyboard,
                               ##  MappingPointer
    first_keycode*: cint       ##  first keycode
    count*: cint               ##  defines range of change w. first_keycode

  PXChangeDeviceNotifyEvent* = ptr XChangeDeviceNotifyEvent
  XChangeDeviceNotifyEvent* {.final.} = object
    ##  ChangeDeviceNotify event.  This event is sent when an
    ##  XChangeKeyboard or XChangePointer request is made.
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  unused
    deviceid*: XID
    time*: Time
    request*: cint             ##  NewPointer or NewKeyboard

  PXDevicePresenceNotifyEvent* = ptr XDevicePresenceNotifyEvent
  XDevicePresenceNotifyEvent* {.final.} = object
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
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  unused
    time*: Time
    devchange*: XBool
    deviceid*: XID
    control*: XID

  PXDevicePropertyNotifyEvent* = ptr XDevicePropertyNotifyEvent
  XDevicePropertyNotifyEvent* {.final.} = object
    `type`*: cint
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay         ##  Display the event was read from
    window*: Window            ##  unused
    time*: Time
    deviceid*: XID             ##  id of the device that changed
    atom*: Atom                ##  the property that changed
    state*: cint               ##  PropertyNewValue or PropertyDeleted

  PXFeedbackState* = ptr XFeedbackState
  XFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID

  PXKbdFeedbackState* = ptr XKbdFeedbackState
  XKbdFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    click*: cint
    percent*: cint
    pitch*: cint
    duration*: cint
    led_mask*: cint
    global_auto_repeat*: cint
    auto_repeats*: array[32, char]

  PXPtrFeedbackState* = ptr XPtrFeedbackState
  XPtrFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    accelNum*: cint
    accelDenom*: cint
    threshold*: cint

  PXIntegerFeedbackState* = ptr XIntegerFeedbackState
  XIntegerFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    resolution*: cint
    minVal*: cint
    maxVal*: cint

  PXStringFeedbackState* = ptr XStringFeedbackState
  XStringFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    max_symbols*: cint
    num_syms_supported*: cint
    syms_supported*: PKeySym

  PXBellFeedbackState* = ptr XBellFeedbackState
  XBellFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    percent*: cint
    pitch*: cint
    duration*: cint

  PXLedFeedbackState* = ptr XLedFeedbackState
  XLedFeedbackState* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    led_values*: cint
    led_mask*: cint

  PXFeedbackControl* = ptr XFeedbackControl
  XFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID

  PXPtrFeedbackControl* = ptr XPtrFeedbackControl
  XPtrFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    accelNum*: cint
    accelDenom*: cint
    threshold*: cint

  PXKbdFeedbackControl* = ptr XKbdFeedbackControl
  XKbdFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    click*: cint
    percent*: cint
    pitch*: cint
    duration*: cint
    led_mask*: cint
    led_value*: cint
    key*: cint
    auto_repeat_mode*: cint

  PXStringFeedbackControl* = ptr XStringFeedbackControl
  XStringFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    num_keysyms*: cint
    syms_to_display*: PKeySym

  PXIntegerFeedbackControl* = ptr XIntegerFeedbackControl
  XIntegerFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    int_to_display*: cint

  PXBellFeedbackControl* = ptr XBellFeedbackControl
  XBellFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    percent*: cint
    pitch*: cint
    duration*: cint

  PXLedFeedbackControl* = ptr XLedFeedbackControl
  XLedFeedbackControl* {.final.} = object
    class*: XID
    length*: cint
    id*: XID
    led_mask*: cint
    led_values*: cint

  PXDeviceControl* = ptr XDeviceControl
  XDeviceControl* {.final.} = object
    control*: XID
    length*: cint

  PXDeviceResolutionControl* = ptr XDeviceResolutionControl
  XDeviceResolutionControl* {.final.} = object
    control*: XID
    length*: cint
    first_valuator*: cint
    num_valuators*: cint
    resolutions*: ptr cint

  PXDeviceResolutionState* = ptr XDeviceResolutionState
  XDeviceResolutionState* {.final.} = object
    control*: XID
    length*: cint
    num_valuators*: cint
    resolutions*: ptr cint
    min_resolutions*: ptr cint
    max_resolutions*: ptr cint

  PXDeviceAbsCalibControl* = ptr XDeviceAbsCalibControl
  XDeviceAbsCalibControl* {.final.} = object
    control*: XID
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
  XDeviceAbsCalibState* = XDeviceAbsCalibControl

  PXDeviceAbsAreaControl* = ptr XDeviceAbsAreaControl
  XDeviceAbsAreaControl* {.final.} = object
    control*: XID
    length*: cint
    offset_x*: cint
    offset_y*: cint
    width*: cint
    height*: cint
    screen*: cint
    following*: XID

  PXDeviceAbsAreaState* = PXDeviceAbsAreaControl
  XDeviceAbsAreaState* = XDeviceAbsAreaControl

  PXDeviceCoreControl* = ptr XDeviceCoreControl
  XDeviceCoreControl* {.final.} = object
    control*: XID
    length*: cint
    status*: cint

  PXDeviceCoreState* = ptr XDeviceCoreState
  XDeviceCoreState* {.final.} = object
    control*: XID
    length*: cint
    status*: cint
    iscore*: cint

  PXDeviceEnableControl* = ptr XDeviceEnableControl
  XDeviceEnableControl* {.final.} = object
    control*: XID
    length*: cint
    enable*: cint

  PXDeviceEnableState* = PXDeviceEnableControl
  XDeviceEnableState* = XDeviceEnableControl

  PXAnyClassInfo* = ptr XAnyClassInfo
  XAnyClassInfo* {.final.} = object
    class*: XID
    length*: cint

  PXDeviceInfo* = ptr XDeviceInfo
  XDeviceInfo* {.final.} = object
    id*: XID
    `type`*: Atom
    name*: cstring
    num_classes*: cint
    use*: cint
    inputclassinfo*: PXAnyClassInfo

  PXKeyInfo* = ptr XKeyInfo
  XKeyInfo* {.final.} = object
    class*: XID
    length*: cint
    min_keycode*: cushort
    max_keycode*: cushort
    num_keys*: cushort

  PXButtonInfo* = ptr XButtonInfo
  XButtonInfo* {.final.} = object
    class*: XID
    length*: cint
    num_buttons*: cshort

  PXAxisInfo* = ptr XAxisInfo
  XAxisInfo* {.final.} = object
    resolution*: cint
    min_value*: cint
    max_value*: cint

  PXValuatorInfo* = ptr XValuatorInfo
  XValuatorInfo* {.final.} = object
    class*: XID
    length*: cint
    num_axes*: cuchar
    mode*: cuchar
    motion_buffer*: culong
    axes*: PXAxisInfo

  PXInputClassInfo* = ptr XInputClassInfo
  XInputClassInfo* {.final.} = object
    input_class*: cuchar
    event_type_base*: cuchar

  PXDevice* = ptr XDevice
  XDevice* {.final.} = object
    device_id*: XID
    num_classes*: cint
    classes*: PXInputClassInfo

  PXEventList* = ptr XEventList
  XEventList* {.final.} = object
    event_type*: XEventClass
    device*: XID

  PXDeviceTimeCoord* = ptr XDeviceTimeCoord
  XDeviceTimeCoord* {.final.} = object
    time*: Time
    data*: ptr cint

  PXDeviceState* = ptr XDeviceState
  XDeviceState* {.final.} = object
    device_id*: XID
    num_classes*: cint
    data*: PXInputClass

  PXValuatorState* = ptr XValuatorState
  XValuatorState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_valuators*: cuchar
    mode*: cuchar
    valuators*: ptr cint

  PXKeyState* = ptr XKeyState
  XKeyState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_keys*: cshort
    keys*: array[32, char]

  PXButtonState* = ptr XButtonState
  XButtonState* {.final.} = object
    class*: cuchar
    length*: cuchar
    num_buttons*: cshort
    buttons*: array[32, char]

{.deprecated: [TXDeviceKeyEvent: XDeviceKeyEvent].}
{.deprecated: [TXDeviceKeyPressedEvent: XDeviceKeyPressedEvent].}
{.deprecated: [TXDeviceKeyReleasedEvent: XDeviceKeyReleasedEvent].}
{.deprecated: [TXDeviceButtonEvent: XDeviceButtonEvent].}
{.deprecated: [TXDeviceButtonPressedEvent: XDeviceButtonPressedEvent].}
{.deprecated: [TXDeviceButtonReleasedEvent: XDeviceButtonReleasedEvent].}
{.deprecated: [TXDeviceMotionEvent: XDeviceMotionEvent].}
{.deprecated: [TXDeviceFocusChangeEvent: XDeviceFocusChangeEvent].}
{.deprecated: [TXDeviceFocusInEvent: XDeviceFocusInEvent].}
{.deprecated: [TXDeviceFocusOutEvent: XDeviceFocusOutEvent].}
{.deprecated: [TXProximityNotifyEvent: XProximityNotifyEvent].}
{.deprecated: [TXProximityInEvent: XProximityInEvent].}
{.deprecated: [TXProximityOutEvent: XProximityOutEvent].}
{.deprecated: [TXInputClass: XInputClass].}
{.deprecated: [TXDeviceStateNotifyEvent: XDeviceStateNotifyEvent].}
{.deprecated: [TXValuatorStatus: XValuatorStatus].}
{.deprecated: [TXKeyStatus: XKeyStatus].}
{.deprecated: [TXButtonStatus: XButtonStatus].}
{.deprecated: [TXDeviceMappingEvent: XDeviceMappingEvent].}
{.deprecated: [TXChangeDeviceNotifyEvent: XChangeDeviceNotifyEvent].}
{.deprecated: [TXDevicePresenceNotifyEvent: XDevicePresenceNotifyEvent].}
{.deprecated: [TXDevicePropertyNotifyEvent: XDevicePropertyNotifyEvent].}
{.deprecated: [TXFeedbackState: XFeedbackState].}
{.deprecated: [TXKbdFeedbackState: XKbdFeedbackState].}
{.deprecated: [TXPtrFeedbackState: XPtrFeedbackState].}
{.deprecated: [TXIntegerFeedbackState: XIntegerFeedbackState].}
{.deprecated: [TXStringFeedbackState: XStringFeedbackState].}
{.deprecated: [TXBellFeedbackState: XBellFeedbackState].}
{.deprecated: [TXLedFeedbackState: XLedFeedbackState].}
{.deprecated: [TXFeedbackControl: XFeedbackControl].}
{.deprecated: [TXPtrFeedbackControl: XPtrFeedbackControl].}
{.deprecated: [TXKbdFeedbackControl: XKbdFeedbackControl].}
{.deprecated: [TXStringFeedbackControl: XStringFeedbackControl].}
{.deprecated: [TXIntegerFeedbackControl: XIntegerFeedbackControl].}
{.deprecated: [TXBellFeedbackControl: XBellFeedbackControl].}
{.deprecated: [TXLedFeedbackControl: XLedFeedbackControl].}
{.deprecated: [TXDeviceControl: XDeviceControl].}
{.deprecated: [TXDeviceResolutionControl: XDeviceResolutionControl].}
{.deprecated: [TXDeviceResolutionState: XDeviceResolutionState].}
{.deprecated: [TXDeviceAbsCalibControl: XDeviceAbsCalibControl].}
{.deprecated: [TXDeviceAbsCalibState: XDeviceAbsCalibState].}
{.deprecated: [TXDeviceAbsAreaControl: XDeviceAbsAreaControl].}
{.deprecated: [TXDeviceAbsAreaState: XDeviceAbsAreaState].}
{.deprecated: [TXDeviceCoreControl: XDeviceCoreControl].}
{.deprecated: [TXDeviceCoreState: XDeviceCoreState].}
{.deprecated: [TXDeviceEnableControl: XDeviceEnableControl].}
{.deprecated: [TXDeviceEnableState: XDeviceEnableState].}
{.deprecated: [TXAnyClassInfo: XAnyClassInfo].}
{.deprecated: [TXDeviceInfo: XDeviceInfo].}
{.deprecated: [TXKeyInfo: XKeyInfo].}
{.deprecated: [TXButtonInfo: XButtonInfo].}
{.deprecated: [TXAxisInfo: XAxisInfo].}
{.deprecated: [TXValuatorInfo: XValuatorInfo].}
{.deprecated: [TXInputClassInfo: XInputClassInfo].}
{.deprecated: [TXDevice: XDevice].}
{.deprecated: [TXEventList: XEventList].}
{.deprecated: [TXDeviceTimeCoord: XDeviceTimeCoord].}
{.deprecated: [TXDeviceState: XDeviceState].}
{.deprecated: [TXValuatorState: XValuatorState].}
{.deprecated: [TXKeyState: XKeyState].}
{.deprecated: [TXButtonState: XButtonState].}

{.push cdecl, importc, dynlib: libXi.}

proc XChangeKeyboardDevice*(a1: PDisplay, a2: PXDevice): cint
proc XChangePointerDevice*(a1: PDisplay, a2: PXDevice, a3, a4: cint): cint
proc XGrabDevice*(a1: PDisplay, a2: PXDevice, a3: Window, a4: XBool, a5: cint,
                 a6: ptr UncheckedArray[XEventClass], a7, a8: cint, a9: Time): cint
proc XUngrabDevice*(a1: PDisplay, a2: PXDevice, a3: Time): cint
proc XGrabDeviceKey*(a1: PDisplay, a2: PXDevice, a3, a4: cuint,
                    a5: PXDevice, a6: Window, a7: XBool, a8: cuint,
                    a9: ptr UncheckedArray[XEventClass], a10, a11: cint): cint
proc XUngrabDeviceKey*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                      a5: PXDevice, a6: Window): cint
proc XGrabDeviceButton*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                       a5: PXDevice, a6: Window, a7: XBool, a8: cuint,
                       a9: ptr UncheckedArray[XEventClass], a10: cint, a11: cint): cint
proc XUngrabDeviceButton*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: cuint,
                         a5: PXDevice, a6: Window): cint
proc XAllowDeviceEvents*(a1: PDisplay, a2: PXDevice, a3: cint, a4: Time): cint
proc XGetDeviceFocus*(a1: PDisplay, a2: PXDevice, a3: PWindow, a4: ptr cint,
                     a5: ptr Time): cint
proc XSetDeviceFocus*(a1: PDisplay, a2: PXDevice, a3: Window, a4: cint, a5: Time): cint
proc XGetFeedbackControl*(a1: PDisplay, a2: PXDevice, a3: ptr cint): PXFeedbackState
proc XFreeFeedbackList*(a1: PXFeedbackState)
proc XChangeFeedbackControl*(a1: PDisplay, a2: PXDevice, a3: culong,
                            a4: PXFeedbackControl): cint
proc XDeviceBell*(a1: PDisplay, a2: PXDevice, a3, a4: XID, a5: cint): cint
proc XGetDeviceKeyMapping*(a1: PDisplay, a2: PXDevice,
  a3: (when xNeedWidePrototypes: cuint else: KeyCode),
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
proc XOpenDevice*(a1: PDisplay, a2: XID): PXDevice
proc XCloseDevice*(a1: PDisplay, a2: PXDevice): cint
proc XSetDeviceMode*(a1: PDisplay, a2: PXDevice, a3: cint): cint
proc XSetDeviceValuators*(a1: PDisplay, a2: PXDevice, a3: ptr cint, a4: cint, a5: cint): cint
proc XGetDeviceControl*(a1: PDisplay, a2: PXDevice, a3: cint): PXDeviceControl
proc XChangeDeviceControl*(a1: PDisplay, a2: PXDevice, a3: cint,
                          a4: PXDeviceControl): cint
proc XSelectExtensionEvent*(a1: PDisplay, a2: Window, a3: ptr UncheckedArray[XEventClass], a4: cint): cint
proc XGetSelectedExtensionEvents*(a1: PDisplay, a2: Window, a3: ptr cint,
                                 a4: ptr ptr UncheckedArray[XEventClass], a5: ptr cint,
                                 a6: ptr ptr UncheckedArray[XEventClass]): cint
proc XChangeDeviceDontPropagateList*(a1: PDisplay, a2: Window, a3: cint,
                                    a4: ptr UncheckedArray[XEventClass], a5: cint): cint
proc XGetDeviceDontPropagateList*(a1: PDisplay, a2: Window, a3: ptr cint): ptr UncheckedArray[XEventClass]
proc XSendExtensionEvent*(a1: PDisplay, a2: PXDevice, a3: Window, a4: XBool, a5: cint,
                         a6: ptr UncheckedArray[XEventClass], a7: PXEvent): Status
proc XGetDeviceMotionEvents*(a1: PDisplay, a2: PXDevice, a3, a4: Time,
                            a5, a6, a7: ptr cint): PXDeviceTimeCoord
proc XFreeDeviceMotionEvents*(a1: PXDeviceTimeCoord)
proc XFreeDeviceControl*(a1: PXDeviceControl)
proc XListDeviceProperties*(a1: PDisplay, a2: PXDevice, a3: ptr cint): PAtom
proc XChangeDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: Atom, a4: Atom, a5: cint,
                           a6: cint, a7: cstring, a8: cint)
proc XDeleteDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: Atom)
proc XGetDeviceProperty*(a1: PDisplay, a2: PXDevice, a3: Atom, a4, a5: clong,
                        a6: XBool, a7: Atom, a8: PAtom, a9: ptr cint, a10: ptr culong,
                        a11: ptr culong, a12: ptr cstring): Status

{.pop.}
