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
  PXRecordClientSpec* = ptr TXRecordClientSpec
  TXRecordClientSpec* = culong
  PXRecordContext* = ptr TXRecordContext
  TXRecordContext* = culong

  PXRecordRange8* = ptr TXRecordRange8
  TXRecordRange8* {.final.} = object
    first*: cuchar
    last*: cuchar

  PXRecordRange16* = ptr TXRecordRange16
  TXRecordRange16* {.final.} = object
    first*: cushort
    last*: cushort

  PXRecordExtRange* = ptr TXRecordExtRange
  TXRecordExtRange* {.final.} = object
    ext_major*: TXRecordRange8
    ext_minor*: TXRecordRange16

  PXRecordRange* = ptr TXRecordRange
  TXRecordRange* {.final.} = object
    core_requests*: TXRecordRange8 ##  core X requests
    core_replies*: TXRecordRange8 ##  core X replies
    ext_requests*: TXRecordExtRange ##  extension requests
    ext_replies*: TXRecordExtRange ##  extension replies
    delivered_events*: TXRecordRange8 ##  delivered core and ext events
    device_events*: TXRecordRange8 ##  all core and ext device events
    errors*: TXRecordRange8     ##  core X and ext errors
    client_started*: TBool      ##  connection setup reply
    client_died*: TBool         ##  notice of client disconnect

  PXRecordClientInfo* = ptr TXRecordClientInfo
  TXRecordClientInfo* {.final.} = object
    client*: TXRecordClientSpec
    nranges*: culong
    ranges*: ptr UncheckedArray[TXRecordRange]

  PXRecordState* = ptr TXRecordState
  TXRecordState* {.final.} = object
    enabled*: TBool
    datum_flags*: cint
    nclients*: culong
    client_info*: ptr UncheckedArray[TXRecordClientInfo]

  PXRecordInterceptData* = ptr TXRecordInterceptData
  TXRecordInterceptData* {.final.} = object
    id_base*: TXID
    server_time*: TTime
    client_seq*: culong
    category*: cint
    client_swapped*: TBool
    data*: cstring
    data_len*: culong          ##  in 4-byte units

  TXRecordInterceptProc* = proc (a1: TXPointer, a2: PXRecordInterceptData)


{.push cdecl, importc, dynlib: libXtst.}

proc XRecordIdBaseMask*(dpy: PDisplay): TXID
proc XRecordQueryVersion*(a1: PDisplay, a2, a3: ptr cint): TStatus
proc XRecordCreateContext*(a1: PDisplay,
                          a2: cint, a3: PXRecordClientSpec,
                          a4: cint, a5: ptr UncheckedArray[TXRecordRange],
                          a6: cint): TXRecordContext
proc XRecordAllocRange*: PXRecordRange
proc XRecordRegisterClients*(a1: PDisplay,
                            a2: TXRecordContext,
                            a3: cint, a4: PXRecordClientSpec,
                            a5: cint, a6: ptr UncheckedArray[TXRecordRange],
                            a7: cint): TStatus
proc XRecordUnregisterClients*(a1: PDisplay,
                              a2: TXRecordContext,
                              a3: PXRecordClientSpec,
                              a4: cint): TStatus
proc XRecordGetContext*(a1: PDisplay,
                       a2: TXRecordContext,
                       a3: ptr UncheckedArray[TXRecordState]): TStatus
proc XRecordFreeState*(a1: PXRecordState)
proc XRecordEnableContext*(a1: PDisplay,
                          a2: TXRecordContext,
                          a3: TXRecordInterceptProc,
                          a4: TXPointer): TStatus
proc XRecordEnableContextAsync*(a1: PDisplay, a2: TXRecordContext,
                               a3: TXRecordInterceptProc,
                               a4: TXPointer): TStatus
proc XRecordProcessReplies*(a1: PDisplay)
proc XRecordFreeData*(a1: PXRecordInterceptData)
proc XRecordDisableContext*(a1: PDisplay, a2: TXRecordContext): TStatus
proc XRecordFreeContext*(a1: PDisplay, a2: TXRecordContext): TStatus
proc XTestQueryExtension*(a1: PDisplay, a2, a3, a4, a5: ptr cint): TBool
proc XTestCompareCursorWithWindow*(a1: PDisplay, a2: TWindow, a3: TCursor): TBool
proc XTestCompareCurrentCursorWithWindow*(a1: PDisplay, a2: TWindow): TBool
proc XTestFakeKeyEvent*(a1: PDisplay, a2: cuint, a3: TBool, a4: culong): cint
proc XTestFakeButtonEvent*(a1: PDisplay, a2: cuint, a3: TBool, a4: culong): cint
proc XTestFakeMotionEvent*(a1: PDisplay, a2, a3, a4: cint, a5: culong): cint
proc XTestFakeRelativeMotionEvent*(a1: PDisplay, a2, a3: cint, a4: culong): cint
proc XTestFakeDeviceKeyEvent*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: TBool,
                             a5: ptr cint, a6: cint, a7: culong): cint
proc XTestFakeDeviceButtonEvent*(a1: PDisplay, a2: PXDevice, a3: cuint, a4: TBool,
                                a5: ptr cint, a6: cint, a7: culong): cint
proc XTestFakeProximityEvent*(a1: PDisplay, a2: PXDevice, a3: TBool, a4: ptr cint,
                             a5: cint, a6: culong): cint
proc XTestFakeDeviceMotionEvent*(a1: PDisplay, a2: PXDevice, a3: TBool, a4: cint,
                                a5: ptr cint, a6: cint, a7: culong): cint
proc XTestGrabControl*(a1: PDisplay, a2: TBool): cint
proc XTestSetGContextOfGC*(a1: TGC, a2: TGContext)
proc XTestSetVisualIDOfVisual*(a1: PVisual, a2: TVisualID)
proc XTestDiscard*(a1: PDisplay): TStatus

{.pop.}
