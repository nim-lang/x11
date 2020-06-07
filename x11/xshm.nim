import
  x, xlib

const
 libXext* = "libXext.so(.6|)"

#
#  Automatically converted by H2Pas 0.99.15 from xshm.h
#  The following command line parameters were used:
#    -p
#    -T
#    -S
#    -d
#    -c
#    xshm.h
#

const
  constX_ShmQueryVersion* = 0
  constX_ShmAttach* = 1
  constX_ShmDetach* = 2
  constX_ShmPutImage* = 3
  constX_ShmGetImage* = 4
  constX_ShmCreatePixmap* = 5
  ShmCompletion* = 0
  ShmNumberEvents* = ShmCompletion + 1
  BadShmSeg* = 0
  ShmNumberErrors* = BadShmSeg + 1

type
  PShmSeg* = ptr ShmSeg
  ShmSeg* = culong

  PXShmCompletionEvent* = ptr XShmCompletionEvent
  XShmCompletionEvent*{.final.} = object
    theType*: cint
    serial*: culong
    send_event*: XBool
    display*: PDisplay
    drawable*: Drawable
    major_code*: cint
    minor_code*: cint
    shmseg*: ShmSeg
    offset*: culong

  PXShmSegmentInfo* = ptr XShmSegmentInfo
  XShmSegmentInfo*{.final.} = object
    shmseg*: ShmSeg
    shmid*: cint
    shmaddr*: cstring
    readOnly*: XBool

{.deprecated: [TShmSeg: ShmSeg].}
{.deprecated: [TXShmCompletionEvent: XShmCompletionEvent].}
{.deprecated: [TXShmSegmentInfo: XShmSegmentInfo].}

proc XShmQueryExtension*(para1: PDisplay): XBool{.cdecl, dynlib: libXext, importc.}
proc XShmGetEventBase*(para1: PDisplay): cint{.cdecl, dynlib: libXext, importc.}
proc XShmQueryVersion*(para1: PDisplay, para2: Pcint, para3: Pcint, para4: PBool): XBool{.
    cdecl, dynlib: libXext, importc.}
proc XShmPixmapFormat*(para1: PDisplay): cint{.cdecl, dynlib: libXext, importc.}
proc XShmAttach*(para1: PDisplay, para2: PXShmSegmentInfo): Status{.cdecl,
    dynlib: libXext, importc.}
proc XShmDetach*(para1: PDisplay, para2: PXShmSegmentInfo): Status{.cdecl,
    dynlib: libXext, importc.}
proc XShmPutImage*(para1: PDisplay, para2: Drawable, para3: GC,
                   para4: PXImage, para5: cint, para6: cint, para7: cint,
                   para8: cint, para9: cuint, para10: cuint, para11: XBool): Status{.
    cdecl, dynlib: libXext, importc.}
proc XShmGetImage*(para1: PDisplay, para2: Drawable, para3: PXImage,
                   para4: cint, para5: cint, para6: culong): Status{.cdecl,
    dynlib: libXext, importc.}
proc XShmCreateImage*(para1: PDisplay, para2: PVisual, para3: cuint,
                      para4: cint, para5: cstring, para6: PXShmSegmentInfo,
                      para7: cuint, para8: cuint): PXImage{.cdecl,
    dynlib: libXext, importc.}
proc XShmCreatePixmap*(para1: PDisplay, para2: Drawable, para3: cstring,
                       para4: PXShmSegmentInfo, para5: cuint, para6: cuint,
                       para7: cuint): Pixmap{.cdecl, dynlib: libXext, importc.}
# implementation
