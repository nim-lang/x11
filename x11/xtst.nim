import x, xlib, xinput

const
  libXtst = "libXtst.so(.6|)"

  recordName* = "RECORD"
  recordMajorVersion* = 1
  recordMinorVersion* = 13
  recordLowestMajorVersion* = 1
  recordLowestMinorVersion* = 12

  xRecordBadContext* = 0

  recordNumErrors* = xRecordBadContext + 1
  recordNumEvents* = 0

  xRecordFromServerTime* = 0x01
  xRecordFromClientTime* = 0x02
  xRecordFromClientSequence* = 0x04

  xRecordCurrentClients* = 1
  xRecordFutureClients* = 2
  xRecordAllClients* = 3

  XRecordFromServer* = 0
  XRecordFromClient* = 1
  XRecordClientStarted* = 2
  XRecordClientDied* = 3
  XRecordStartOfData* = 4
  XRecordEndOfData* = 5

type
  PXRecordClientSpec* = ptr XRecordClientSpec
  XRecordClientSpec* = culong

  PXRecordContext* = ptr XRecordContext
  XRecordContext* = culong

  PXRecordRange8* = ptr XRecordRange8
  XRecordRange8* {.final.} = object
    first*: cuchar
    last*: cuchar

  PXRecordRange16* = ptr XRecordRange16
  XRecordRange16* {.final.} = object
    first*: cushort
    last*: cushort

  PXRecordExtRange* = ptr XRecordExtRange
  XRecordExtRange* {.final.} = object
    ext_major*: XRecordRange8
    ext_minor*: XRecordRange16

  PXRecordRange* = ptr XRecordRange
  XRecordRange* {.final.} = object
    core_requests*: XRecordRange8 ##  core X requests
    core_replies*: XRecordRange8 ##  core X replies
    ext_requests*: XRecordExtRange ##  extension requests
    ext_replies*: XRecordExtRange ##  extension replies
    delivered_events*: XRecordRange8 ##  delivered core and ext events
    device_events*: XRecordRange8 ##  all core and ext device events
    errors*: XRecordRange8     ##  core X and ext errors
    client_started*: XBool      ##  connection setup reply
    client_died*: XBool         ##  notice of client disconnect

  PXRecordClientInfo* = ptr XRecordClientInfo
  XRecordClientInfo* {.final.} = object
    client*: XRecordClientSpec
    nranges*: culong
    ranges*: ptr UncheckedArray[XRecordRange]

  PXRecordState* = ptr XRecordState
  XRecordState* {.final.} = object
    enabled*: XBool
    datum_flags*: cint
    nclients*: culong
    client_info*: ptr UncheckedArray[XRecordClientInfo]

  PXRecordInterceptData* = ptr XRecordInterceptData
  XRecordInterceptData* {.final.} = object
    id_base*: XID
    server_time*: Time
    client_seq*: culong
    category*: cint
    client_swapped*: XBool
    data*: cstring
    data_len*: culong          ##  in 4-byte units

  XRecordInterceptProc* = proc (a1: XPointer, a2: PXRecordInterceptData)

{.deprecated: [TXRecordClientSpec: XRecordClientSpec].}
{.deprecated: [TXRecordContext: XRecordContext].}
{.deprecated: [TXRecordRange8: XRecordRange8].}
{.deprecated: [TXRecordRange16: XRecordRange16].}
{.deprecated: [TXRecordExtRange: XRecordExtRange].}
{.deprecated: [TXRecordRange: XRecordRange].}
{.deprecated: [TXRecordClientInfo: XRecordClientInfo].}
{.deprecated: [TXRecordState: XRecordState].}
{.deprecated: [TXRecordInterceptData: XRecordInterceptData].}
{.deprecated: [TXRecordInterceptProc: XRecordInterceptProc].}

{.push cdecl, importc, dynlib: libXtst.}

proc XRecordIdBaseMask*(dpy: PDisplay): XID
proc XRecordQueryVersion*(a1: PDisplay, a2, a3: ptr cint): Status
proc XRecordCreateContext*(a1: PDisplay,
                          a2: cint, a3: PXRecordClientSpec,
                          a4: cint, a5: ptr UncheckedArray[XRecordRange],
                          a6: cint): XRecordContext
proc XRecordAllocRange*: PXRecordRange
proc XRecordRegisterClients*(a1: PDisplay,
                            a2: XRecordContext,
                            a3: cint, a4: PXRecordClientSpec,
                            a5: cint, a6: ptr UncheckedArray[XRecordRange],
                            a7: cint): Status
proc XRecordUnregisterClients*(a1: PDisplay,
                              a2: XRecordContext,
                              a3: PXRecordClientSpec,
                              a4: cint): Status
proc XRecordGetContext*(a1: PDisplay,
                       a2: XRecordContext,
                       a3: ptr UncheckedArray[XRecordState]): Status
proc XRecordFreeState*(a1: PXRecordState)
proc XRecordEnableContext*(a1: PDisplay,
                          a2: XRecordContext,
                          a3: XRecordInterceptProc,
                          a4: XPointer): Status
proc XRecordEnableContextAsync*(a1: PDisplay, a2: XRecordContext,
                               a3: XRecordInterceptProc,
                               a4: XPointer): Status
proc XRecordProcessReplies*(a1: PDisplay)
proc XRecordFreeData*(a1: PXRecordInterceptData)
proc XRecordDisableContext*(a1: PDisplay, a2: XRecordContext): Status
proc XRecordFreeContext*(a1: PDisplay, a2: XRecordContext): Status
proc XTestQueryExtension*(a1: PDisplay, a2, a3, a4, a5: ptr cint): XBool
proc XTestCompareCursorWithWindow*(a1: PDisplay, a2: Window, a3: Cursor): XBool
proc XTestCompareCurrentCursorWithWindow*(a1: PDisplay, a2: Window): XBool
proc XTestFakeKeyEvent*(a1: PDisplay, a2: cuint, a3: XBool, a4: culong): cint
proc XTestFakeButtonEvent*(a1: PDisplay, a2: cuint, a3: XBool, a4: culong): cint
proc XTestFakeMotionEvent*(a1: PDisplay, a2, a3, a4: cint, a5: culong): cint
proc XTestFakeRelativeMotionEvent*(a1: PDisplay, a2, a3: cint, a4: culong): cint
proc XTestFakeDeviceKeyEvent*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: XBool,
                             a5: ptr cint, a6: cint, a7: culong): cint
proc XTestFakeDeviceButtonEvent*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: XBool,
                                a5: ptr cint, a6: cint, a7: culong): cint
proc XTestFakeProximityEvent*(a1: PDisplay, a2: PXDevice, a3: XBool, a4: ptr cint,
                             a5: cint, a6: culong): cint
proc XTestFakeDeviceMotionEvent*(a1: PDisplay, a2: PXDevice, a3: XBool, a4: cint,
                                a5: ptr cint, a6: cint, a7: culong): cint
proc XTestGrabControl*(a1: PDisplay, a2: XBool): cint
proc XTestSetGContextOfGC*(a1: GC, a2: GContext)
proc XTestSetVisualIDOfVisual*(a1: PVisual, a2: VisualID)
proc XTestDiscard*(a1: PDisplay): Status

{.pop.}
