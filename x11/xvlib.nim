#***********************************************************
#Copyright 1991 by Digital Equipment Corporation, Maynard, Massachusetts,
#and the Massachusetts Institute of Technology, Cambridge, Massachusetts.
#
#                        All Rights Reserved
#
#Permission to use, copy, modify, and distribute this software and its
#documentation for any purpose and without fee is hereby granted,
#provided that the above copyright notice appear in all copies and that
#both that copyright notice and this permission notice appear in
#supporting documentation, and that the names of Digital or MIT not be
#used in advertising or publicity pertaining to distribution of the
#software without specific, written prior permission.
#
#DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
#ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
#DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
#ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
#WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
#ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
#SOFTWARE.
#
#******************************************************************
# $XFree86: xc/include/extensions/Xvlib.h,v 1.3 1999/12/11 19:28:48 mvojkovi Exp $
#*
#** File:
#**
#**   Xvlib.h --- Xv library public header file
#**
#** Author:
#**
#**   David Carver (Digital Workstation Engineering/Project Athena)
#**
#** Revisions:
#**
#**   26.06.91 Carver
#**     - changed XvFreeAdaptors to XvFreeAdaptorInfo
#**     - changed XvFreeEncodings to XvFreeEncodingInfo
#**
#**   11.06.91 Carver
#**     - changed SetPortControl to SetPortAttribute
#**     - changed GetPortControl to GetPortAttribute
#**     - changed QueryBestSize
#**
#**   05.15.91 Carver
#**     - version 2.0 upgrade
#**
#**   01.24.91 Carver
#**     - version 1.4 upgrade
#**
#*

import
  x, xlib, xshm, xv

const
  libXv* = "libXv.so"

type
  PXvRational* = ptr XvRational
  XvRational*{.final.} = object
    numerator*: cint
    denominator*: cint

  PXvAttribute* = ptr XvAttribute
  XvAttribute*{.final.} = object
    flags*: cint              # XvGettable, XvSettable
    min_value*: cint
    max_value*: cint
    name*: cstring

  PPXvEncodingInfo* = ptr PXvEncodingInfo
  PXvEncodingInfo* = ptr XvEncodingInfo
  XvEncodingInfo*{.final.} = object
    encoding_id*: XvEncodingID
    name*: cstring
    width*: culong
    height*: culong
    rate*: XvRational
    num_encodings*: culong

  PXvFormat* = ptr XvFormat
  XvFormat*{.final.} = object
    depth*: cchar
    visual_id*: culong

  PPXvAdaptorInfo* = ptr PXvAdaptorInfo
  PXvAdaptorInfo* = ptr XvAdaptorInfo
  XvAdaptorInfo*{.final.} = object
    base_id*: XvPortID
    num_ports*: culong
    thetype*: cchar
    name*: cstring
    num_formats*: culong
    formats*: PXvFormat
    num_adaptors*: culong

  PXvVideoNotifyEvent* = ptr XvVideoNotifyEvent
  XvVideoNotifyEvent*{.final.} = object
    theType*: cint
    serial*: culong          # # of last request processed by server
    send_event*: XBool        # true if this came from a SendEvent request
    display*: PDisplay       # Display the event was read from
    drawable*: Drawable      # drawable
    reason*: culong          # what generated this event
    port_id*: XvPortID       # what port
    time*: Time              # milliseconds

  PXvPortNotifyEvent* = ptr XvPortNotifyEvent
  XvPortNotifyEvent*{.final.} = object
    theType*: cint
    serial*: culong          # # of last request processed by server
    send_event*: XBool        # true if this came from a SendEvent request
    display*: PDisplay       # Display the event was read from
    port_id*: XvPortID       # what port
    time*: Time              # milliseconds
    attribute*: Atom         # atom that identifies attribute
    value*: clong            # value of attribute

  PXvEvent* = ptr XvEvent
  XvEvent*{.final.} = object
    pad*: array[0..23, clong] # case longint of
                              #      0 : (
                              #            theType : cint;
                              #	  );
                              #      1 : (
                              #            xvvideo : XvVideoNotifyEvent;
                              #          );
                              #      2 : (
                              #            xvport : XvPortNotifyEvent;
                              #          );
                              #      3 : (
                              #
                              #          );

  PXvImageFormatValues* = ptr XvImageFormatValues
  XvImageFormatValues*{.final.} = object
    id*: cint                 # Unique descriptor for the format
    theType*: cint            # XvRGB, XvYUV
    byte_order*: cint         # LSBFirst, MSBFirst
    guid*: array[0..15, cchar] # Globally Unique IDentifier
    bits_per_pixel*: cint
    format*: cint             # XvPacked, XvPlanar
    num_planes*: cint         # for RGB formats only
    depth*: cint
    red_mask*: cuint
    green_mask*: cuint
    blue_mask*: cuint         # for YUV formats only
    y_sample_bits*: cuint
    u_sample_bits*: cuint
    v_sample_bits*: cuint
    horz_y_period*: cuint
    horz_u_period*: cuint
    horz_v_period*: cuint
    vert_y_period*: cuint
    vert_u_period*: cuint
    vert_v_period*: cuint
    component_order*: array[0..31, char] # eg. UYVY
    scanline_order*: cint     # XvTopToBottom, XvBottomToTop

  PXvImage* = ptr XvImage
  XvImage*{.final.} = object
    id*: cint
    width*, height*: cint
    data_size*: cint          # bytes
    num_planes*: cint
    pitches*: cint           # bytes
    offsets*: cint           # bytes
    data*: pointer
    obdata*: XPointer

{.deprecated: [TXvRational: XvRational].}
{.deprecated: [TXvAttribute: XvAttribute].}
{.deprecated: [TXvEncodingInfo: XvEncodingInfo].}
{.deprecated: [TXvFormat: XvFormat].}
{.deprecated: [TXvAdaptorInfo: XvAdaptorInfo].}
{.deprecated: [TXvVideoNotifyEvent: XvVideoNotifyEvent].}
{.deprecated: [TXvPortNotifyEvent: XvPortNotifyEvent].}
{.deprecated: [TXvEvent: XvEvent].}
{.deprecated: [TXvImageFormatValues: XvImageFormatValues].}
{.deprecated: [TXvImage: XvImage].}

proc XvQueryExtension*(display: PDisplay, p_version, p_revision, p_requestBase,
    p_eventBase, p_errorBase: cuint): cint{.cdecl, dynlib: libXv, importc.}
proc XvQueryAdaptors*(display: PDisplay, window: Window, p_nAdaptors: cuint,
                      p_pAdaptors: PPXvAdaptorInfo): cint{.cdecl, dynlib: libXv,
    importc.}
proc XvQueryEncodings*(display: PDisplay, port: XvPortID, p_nEncoding: cuint,
                       p_pEncoding: PPXvEncodingInfo): cint{.cdecl,
    dynlib: libXv, importc.}
proc XvPutVideo*(display: PDisplay, port: XvPortID, d: Drawable, gc: GC,
                 vx, vy: cint, vw, vh: cuint, dx, dy: cint, dw, dh: cuint): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvPutStill*(display: PDisplay, port: XvPortID, d: Drawable, gc: GC,
                 vx, vy: cint, vw, vh: cuint, dx, dy: cint, dw, dh: cuint): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvGetVideo*(display: PDisplay, port: XvPortID, d: Drawable, gc: GC,
                 vx, vy: cint, vw, vh: cuint, dx, dy: cint, dw, dh: cuint): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvGetStill*(display: PDisplay, port: XvPortID, d: Drawable, gc: GC,
                 vx, vy: cint, vw, vh: cuint, dx, dy: cint, dw, dh: cuint): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvStopVideo*(display: PDisplay, port: XvPortID, drawable: Drawable): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvGrabPort*(display: PDisplay, port: XvPortID, time: Time): cint{.cdecl,
    dynlib: libXv, importc.}
proc XvUngrabPort*(display: PDisplay, port: XvPortID, time: Time): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvSelectVideoNotify*(display: PDisplay, drawable: Drawable, onoff: XBool): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvSelectPortNotify*(display: PDisplay, port: XvPortID, onoff: XBool): cint{.
    cdecl, dynlib: libXv, importc.}
proc XvSetPortAttribute*(display: PDisplay, port: XvPortID, attribute: Atom,
                         value: cint): cint{.cdecl, dynlib: libXv, importc.}
proc XvGetPortAttribute*(display: PDisplay, port: XvPortID, attribute: Atom,
                         p_value: cint): cint{.cdecl, dynlib: libXv, importc.}
proc XvQueryBestSize*(display: PDisplay, port: XvPortID, motion: XBool,
                      vid_w, vid_h, drw_w, drw_h: cuint,
                      p_actual_width, p_actual_height: cuint): cint{.cdecl,
    dynlib: libXv, importc.}
proc XvQueryPortAttributes*(display: PDisplay, port: XvPortID, number: cint): PXvAttribute{.
    cdecl, dynlib: libXv, importc.}
proc XvFreeAdaptorInfo*(adaptors: PXvAdaptorInfo){.cdecl, dynlib: libXv, importc.}
proc XvFreeEncodingInfo*(encodings: PXvEncodingInfo){.cdecl, dynlib: libXv,
    importc.}
proc XvListImageFormats*(display: PDisplay, port_id: XvPortID,
                         count_return: cint): PXvImageFormatValues{.cdecl,
    dynlib: libXv, importc.}
proc XvCreateImage*(display: PDisplay, port: XvPortID, id: cint, data: pointer,
                    width, height: cint): PXvImage{.cdecl, dynlib: libXv,
    importc.}
proc XvPutImage*(display: PDisplay, id: XvPortID, d: Drawable, gc: GC,
                 image: PXvImage, src_x, src_y: cint, src_w, src_h: cuint,
                 dest_x, dest_y: cint, dest_w, dest_h: cuint): cint{.cdecl,
    dynlib: libXv, importc.}
proc XvShmPutImage*(display: PDisplay, id: XvPortID, d: Drawable, gc: GC,
                    image: PXvImage, src_x, src_y: cint, src_w, src_h: cuint,
                    dest_x, dest_y: cint, dest_w, dest_h: cuint,
                    send_event: XBool): cint{.cdecl, dynlib: libXv, importc.}
proc XvShmCreateImage*(display: PDisplay, port: XvPortID, id: cint,
                       data: pointer, width, height: cint,
                       shminfo: PXShmSegmentInfo): PXvImage{.cdecl,
    dynlib: libXv, importc.}
# implementation
