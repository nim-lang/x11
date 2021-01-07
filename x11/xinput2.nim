# *****************************************
# Generated from <X11/extensions/XInput2.h>
# *****************************************
import x, xlib, xi2

# <X11/extensions/xfixes.h>
type PointerBarrier* = XID

type
  PXIAddMasterInfo* = ptr XIAddMasterInfo
  XIAddMasterInfo* {.final.} = object
    `type`*: cint
    name*: cstring
    send_core*: XBool
    enable*: XBool

  PXIRemoveMasterInfo* = ptr XIRemoveMasterInfo
  XIRemoveMasterInfo* {.final.} = object
    `type`*: cint
    deviceid*: cint
    return_mode*: cint         ##  AttachToMaster, Floating
    return_pointer*: cint
    return_keyboard*: cint

  PXIAttachSlaveInfo* = ptr XIAttachSlaveInfo
  XIAttachSlaveInfo* {.final.} = object
    `type`*: cint
    deviceid*: cint
    new_master*: cint

  PXIDetachSlaveInfo* = ptr XIDetachSlaveInfo
  XIDetachSlaveInfo* {.final.} = object
    `type`*: cint
    deviceid*: cint

  PXIAnyHierarchyChangeInfo* = ptr XIAnyHierarchyChangeInfo
  XIAnyHierarchyChangeInfo* {.final, union.} = object
    `type`*: cint              ##  must be first element
    add*: XIAddMasterInfo
    remove*: XIRemoveMasterInfo
    attach*: XIAttachSlaveInfo
    detach*: XIDetachSlaveInfo

  PXIModifierState* = ptr XIModifierState
  XIModifierState* {.final.} = object
    base*: cint
    latched*: cint
    locked*: cint
    effective*: cint

  PXIGroupState* = ptr XIGroupState
  XIGroupState* = XIModifierState

  PXIButtonState* = ptr XIButtonState
  XIButtonState* {.final.} = object
    mask_len*: cint
    mask*: ptr cuchar

  PXIValuatorState* = ptr XIValuatorState
  XIValuatorState* {.final.} = object
    mask_len*: cint
    mask*: ptr cuchar
    values*: ptr cdouble

  PXIEventMask* = ptr XIEventMask
  XIEventMask* {.final.} = object
    deviceid*: cint
    mask_len*: cint
    mask*: ptr cuchar

  PXIAnyClassInfo* = ptr XIAnyClassInfo
  XIAnyClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint

  PXIButtonClassInfo* = ptr XIButtonClassInfo
  XIButtonClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint
    num_buttons*: cint
    labels*: PAtom
    state*: XIButtonState

  PXIKeyClassInfo* = ptr XIKeyClassInfo
  XIKeyClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint
    num_keycodes*: cint
    keycodes*: ptr cint

  PXIValuatorClassInfo* = ptr XIValuatorClassInfo
  XIValuatorClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint
    number*: cint
    label*: Atom
    min*: cdouble
    max*: cdouble
    value*: cdouble
    resolution*: cint
    mode*: cint


##  new in XI 2.1

type
  PXIScrollClassInfo* = ptr XIScrollClassInfo
  XIScrollClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint
    number*: cint
    scroll_type*: cint
    increment*: cdouble
    flags*: cint

  PXITouchClassInfo* = ptr XITouchClassInfo
  XITouchClassInfo* {.final.} = object
    `type`*: cint
    sourceid*: cint
    mode*: cint
    num_touches*: cint

  PXIDeviceInfo* = ptr XIDeviceInfo
  XIDeviceInfo* {.final.} = object
    deviceid*: cint
    name*: cstring
    use*: cint
    attachment*: cint
    enabled*: XBool
    num_classes*: cint
    classes*: ptr ptr XIAnyClassInfo

  PXIGrabModifiers* = ptr XIGrabModifiers
  XIGrabModifiers* {.final.} = object
    modifiers*: cint
    status*: cint

  BarrierEventID* = cuint
  # ------------------------------------------------------------
  PXIBarrierReleasePointerInfo* = ptr XIBarrierReleasePointerInfo
  XIBarrierReleasePointerInfo* {.final.} = object
    deviceid*: cint
    barrier*: PointerBarrier
    eventid*: BarrierEventID

##
##  Generic XI2 event. All XI2 events have the same header.
##

type
  PXIEvent* = ptr XIEvent
  XIEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint
    time*: Time

  PXIHierarchyInfo* = ptr XIHierarchyInfo
  XIHierarchyInfo* {.final.} = object
    deviceid*: cint
    attachment*: cint
    use*: cint
    enabled*: XBool
    flags*: cint

##
##  Notifies the client that the device hierarchy has been changed. The client
##  is expected to re-query the server for the device hierarchy.
##

type
  PXIHierarchyEvent* = ptr XIHierarchyEvent
  XIHierarchyEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint              ##  XI_HierarchyChanged
    time*: Time
    flags*: cint
    num_info*: cint
    info*: ptr XIHierarchyInfo

##
##  Notifies the client that the classes have been changed. This happens when
##  the slave device that sends through the master changes.
##

type
  PXIDeviceChangedEvent* = ptr XIDeviceChangedEvent
  XIDeviceChangedEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint              ##  XI_DeviceChanged
    time*: Time
    deviceid*: cint            ##  id of the device that changed
    sourceid*: cint            ##  Source for the new classes.
    reason*: cint              ##  Reason for the change
    num_classes*: cint
    classes*: ptr ptr XIAnyClassInfo ##  same as in XIDeviceInfo

  PXIDeviceEvent* = ptr XIDeviceEvent
  XIDeviceEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint
    time*: Time
    deviceid*: cint
    sourceid*: cint
    detail*: cint
    root*: Window
    event*: Window
    child*: Window
    root_x*: cdouble
    root_y*: cdouble
    event_x*: cdouble
    event_y*: cdouble
    flags*: cint
    buttons*: XIButtonState
    valuators*: XIValuatorState
    mods*: XIModifierState
    group*: XIGroupState

  PXIRawEvent* = ptr XIRawEvent
  XIRawEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint              ##  XI_RawKeyPress, XI_RawKeyRelease, etc.
    time*: Time
    deviceid*: cint
    sourceid*: cint            ##  Bug: Always 0. https://bugs.freedesktop.org//show_bug.cgi?id=34240
    detail*: cint
    flags*: cint
    valuators*: XIValuatorState
    raw_values*: ptr cdouble

  PXIEnterEvent* = ptr XIEnterEvent
  XIEnterEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint
    time*: Time
    deviceid*: cint
    sourceid*: cint
    detail*: cint
    root*: Window
    event*: Window
    child*: Window
    root_x*: cdouble
    root_y*: cdouble
    event_x*: cdouble
    event_y*: cdouble
    mode*: cint
    focus*: XBool
    same_screen*: XBool
    buttons*: XIButtonState
    mods*: XIModifierState
    group*: XIGroupState

  PXILeaveEvent* = PXIEnterEvent
  PXIFocusInEvent* = PXIEnterEvent
  PXIFocusOutEvent* = PXIEnterEvent
  # ----------------------------------
  XILeaveEvent* = XIEnterEvent
  XIFocusInEvent* = XIEnterEvent
  XIFocusOutEvent* = XIEnterEvent

  PXIPropertyEvent* = ptr XIPropertyEvent
  XIPropertyEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint              ##  XI_PropertyEvent
    time*: Time
    deviceid*: cint            ##  id of the device that changed
    property*: Atom
    what*: cint

  PXITouchOwnershipEvent* = ptr XITouchOwnershipEvent
  XITouchOwnershipEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint
    time*: Time
    deviceid*: cint
    sourceid*: cint
    touchid*: cuint
    root*: Window
    event*: Window
    child*: Window
    flags*: cint

  PXIBarrierEvent* = ptr XIBarrierEvent
  XIBarrierEvent* {.final.} = object
    `type`*: cint              ##  GenericEvent
    serial*: culong            ##  # of last request processed by server
    send_event*: XBool          ##  true if this came from a SendEvent request
    display*: PDisplay       ##  Display the event was read from
    extension*: cint           ##  XI extension offset
    evtype*: cint
    time*: Time
    deviceid*: cint
    sourceid*: cint
    event*: Window
    root*: Window
    root_x*: cdouble
    root_y*: cdouble
    dx*: cdouble
    dy*: cdouble
    dtime*: cint
    flags*: cint
    barrier*: PointerBarrier
    eventid*: BarrierEventID

##
## XI2 Procs, uses same shared object as XI
##
 
{.push cdecl, importc, dynlib: libXi.}

proc XIQueryPointer*(display: PDisplay; deviceid: cint; win: Window;
                    root: PWindow; child: PWindow; root_x: ptr cdouble;
                    root_y: ptr cdouble; win_x: ptr cdouble; win_y: ptr cdouble;
                    buttons: PXIButtonState; mods: PXIModifierState;
                    group: PXIGroupState): XBool
proc XIWarpPointer*(display: PDisplay; deviceid: cint; src_win: Window;
                   dst_win: Window; src_x: cdouble; src_y: cdouble; src_width: cuint;
                   src_height: cuint; dst_x: cdouble; dst_y: cdouble): XBool
proc XIDefineCursor*(display: PDisplay; deviceid: cint; win: Window; cursor: Cursor): Status
proc XIUndefineCursor*(display: PDisplay; deviceid: cint; win: Window): Status
proc XIChangeHierarchy*(display: PDisplay; changes: PXIAnyHierarchyChangeInfo;
                       num_changes: cint): Status
proc XISetClientPointer*(dpy: PDisplay; win: Window; deviceid: cint): Status
proc XIGetClientPointer*(dpy: PDisplay; win: Window; deviceid: ptr cint): XBool
proc XISelectEvents*(dpy: PDisplay; win: Window; masks: PXIEventMask;
                    num_masks: cint): cint
proc XIGetSelectedEvents*(dpy: PDisplay; win: Window; num_masks_return: ptr cint): PXIEventMask
proc XIQueryVersion*(dpy: PDisplay; major_version_inout: ptr cint;
                    minor_version_inout: ptr cint): Status
proc XIQueryDevice*(dpy: PDisplay; deviceid: cint; ndevices_return: ptr cint): PXIDeviceInfo
proc XISetFocus*(dpy: PDisplay; deviceid: cint; focus: Window; time: Time): Status
proc XIGetFocus*(dpy: PDisplay; deviceid: cint; focus_return: PWindow): Status
proc XIGrabDevice*(dpy: PDisplay; deviceid: cint; grab_window: Window; time: Time;
                  cursor: Cursor; grab_mode: cint; paired_device_mode: cint;
                  owner_events: XBool; mask: PXIEventMask): Status
proc XIUngrabDevice*(dpy: PDisplay; deviceid: cint; time: Time): Status
proc XIAllowEvents*(display: PDisplay; deviceid: cint; event_mode: cint; time: Time): Status
proc XIAllowTouchEvents*(display: PDisplay; deviceid: cint; touchid: cuint;
                        grab_window: Window; event_mode: cint): Status
proc XIGrabButton*(display: PDisplay; deviceid: cint; button: cint;
                  grab_window: Window; cursor: Cursor; grab_mode: cint;
                  paired_device_mode: cint; owner_events: cint;
                  mask: PXIEventMask; num_modifiers: cint;
                  modifiers_inout: PXIGrabModifiers): cint
proc XIGrabKeycode*(display: PDisplay; deviceid: cint; keycode: cint;
                   grab_window: Window; grab_mode: cint; paired_device_mode: cint;
                   owner_events: cint; mask: PXIEventMask; num_modifiers: cint;
                   modifiers_inout: PXIGrabModifiers): cint
proc XIGrabEnter*(display: PDisplay; deviceid: cint; grab_window: Window;
                 cursor: Cursor; grab_mode: cint; paired_device_mode: cint;
                 owner_events: cint; mask: PXIEventMask; num_modifiers: cint;
                 modifiers_inout: PXIGrabModifiers): cint
proc XIGrabFocusIn*(display: PDisplay; deviceid: cint; grab_window: Window;
                   grab_mode: cint; paired_device_mode: cint; owner_events: cint;
                   mask: PXIEventMask; num_modifiers: cint;
                   modifiers_inout: PXIGrabModifiers): cint
proc XIGrabTouchBegin*(display: PDisplay; deviceid: cint; grab_window: Window;
                      owner_events: cint; mask: PXIEventMask; num_modifiers: cint;
                      modifiers_inout: PXIGrabModifiers): cint
proc XIUngrabButton*(display: PDisplay; deviceid: cint; button: cint;
                    grab_window: Window; num_modifiers: cint;
                    modifiers: PXIGrabModifiers): Status
proc XIUngrabKeycode*(display: PDisplay; deviceid: cint; keycode: cint;
                     grab_window: Window; num_modifiers: cint;
                     modifiers: PXIGrabModifiers): Status
proc XIUngrabEnter*(display: PDisplay; deviceid: cint; grab_window: Window;
                   num_modifiers: cint; modifiers: PXIGrabModifiers): Status
proc XIUngrabFocusIn*(display: PDisplay; deviceid: cint; grab_window: Window;
                     num_modifiers: cint; modifiers: PXIGrabModifiers): Status
proc XIUngrabTouchBegin*(display: PDisplay; deviceid: cint; grab_window: Window;
                        num_modifiers: cint; modifiers: PXIGrabModifiers): Status
proc XIListProperties*(display: PDisplay; deviceid: cint;
                      num_props_return: ptr cint): PAtom
proc XIChangeProperty*(display: PDisplay; deviceid: cint; property: Atom;
                      `type`: Atom; format: cint; mode: cint; data: ptr cuchar;
                      num_items: cint)
proc XIDeleteProperty*(display: PDisplay; deviceid: cint; property: Atom)
proc XIGetProperty*(display: PDisplay; deviceid: cint; property: Atom; offset: clong;
                   length: clong; delete_property: XBool; `type`: Atom;
                   type_return: PAtom; format_return: ptr cint;
                   num_items_return: ptr culong; bytes_after_return: ptr culong;
                   data: ptr ptr cuchar): Status
proc XIBarrierReleasePointers*(display: PDisplay;
                              barriers: PXIBarrierReleasePointerInfo;
                              num_barriers: cint)
proc XIBarrierReleasePointer*(display: PDisplay; deviceid: cint;
                             barrier: PointerBarrier; eventid: BarrierEventID)
proc XIFreeDeviceInfo*(info: PXIDeviceInfo)

{.pop.}