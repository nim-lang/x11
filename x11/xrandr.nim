#
#  $XFree86: xc/lib/Xrandr/Xrandr.h,v 1.9 2002/09/29 23:39:44 keithp Exp $
#
#  Copyright (C) 2000 Compaq Computer Corporation, Inc.
#  Copyright (C) 2002 Hewlett-Packard Company, Inc.
#
#  Permission to use, copy, modify, distribute, and sell this software and its
#  documentation for any purpose is hereby granted without fee, provided that
#  the above copyright notice appear in all copies and that both that
#  copyright notice and this permission notice appear in supporting
#  documentation, and that the name of Compaq not be used in advertising or
#  publicity pertaining to distribution of the software without specific,
#  written prior permission.  HP makes no representations about the
#  suitability of this software for any purpose.  It is provided "as is"
#  without express or implied warranty.
#
#  HP DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL COMPAQ
#  BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
#  OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
#  CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#  Author:  Jim Gettys, HP Labs, HP.
#

import
  x, xlib

const
  libXrandr* = "libXrandr.so(.2|)"

# * $XFree86: xc/include/extensions/randr.h,v 1.4 2001/11/24 07:24:58 keithp Exp $
# *
# * Copyright (C) 2000, Compaq Computer Corporation,
# * Copyright (C) 2002, Hewlett Packard, Inc.
# *
# * Permission to use, copy, modify, distribute, and sell this software and its
# * documentation for any purpose is hereby granted without fee, provided that
# * the above copyright notice appear in all copies and that both that
# * copyright notice and this permission notice appear in supporting
# * documentation, and that the name of Compaq or HP not be used in advertising
# * or publicity pertaining to distribution of the software without specific,
# * written prior permission.  HP makes no representations about the
# * suitability of this software for any purpose.  It is provided "as is"
# * without express or implied warranty.
# *
# * HP DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
# * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL HP
# * BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# *
# * Author:  Jim Gettys, HP Labs, Hewlett-Packard, Inc.
# *

type
  PRotation* = ptr Rotation
  Rotation* = cushort

  PSizeID* = ptr SizeID
  SizeID* = cushort

  PSubpixelOrder* = ptr SubpixelOrder
  SubpixelOrder* = cushort

  PRRCrtc* = ptr RRCrtc
  RRCrtc* = XID

  PRROutput* = ptr RROutput
  RROutput* = XID

  PRRMode* = ptr RRMode
  RRMode* = XID

  PXRRModeFlags* = ptr XRRModeFlags
  XRRModeFlags* = culong

  PConnection* = ptr Connection
  Connection* = cushort

{.deprecated: [TRotation: Rotation].}
{.deprecated: [TSizeID: SizeID].}
{.deprecated: [TSubpixelOrder: SubpixelOrder].}
{.deprecated: [TRRCrtc: RRCrtc].}
{.deprecated: [TRROutput: RROutput].}
{.deprecated: [TRRMode: RRMode].}
{.deprecated: [TXRRModeFlags: XRRModeFlags].}
{.deprecated: [TConnection: Connection].}

const
  RANDR_NAME* = "RANDR"
  RANDR_MAJOR* = 1
  RANDR_MINOR* = 1
  RRNumberErrors* = 0
  RRNumberEvents* = 1
  constX_RRQueryVersion* = 0 # we skip 1 to make old clients fail pretty immediately
  X_RROldGetScreenInfo* = 1
  X_RR1_0SetScreenConfig* = 2 # V1.0 apps share the same set screen config request id
  constX_RRSetScreenConfig* = 2
  X_RROldScreenChangeSelectInput* = 3 # 3 used to be ScreenChangeSelectInput; deprecated
  constX_RRSelectInput* = 4
  constX_RRGetScreenInfo* = 5      # used in XRRSelectInput
  RRScreenChangeNotifyMask* = 1 shl 0
  RRScreenChangeNotify* = 0   # used in the rotation field; rotation and reflection in 0.1 proto.
  RR_Rotate_0* = 1
  RR_Rotate_90* = 2
  RR_Rotate_180* = 4
  RR_Rotate_270* = 8          # new in 1.0 protocol, to allow reflection of screen
  RR_Reflect_X* = 16
  RR_Reflect_Y* = 32
  RRSetConfigSuccess* = 0
  RRSetConfigInvalidConfigTime* = 1
  RRSetConfigInvalidTime* = 2
  RRSetConfigFailed* = 3
  RR_Connected* = 0
  RR_Disconnected* = 1
  RR_UnknownConnection* = 2

type
  PXRRScreenSize* = ptr XRRScreenSize
  XRRScreenSize*{.final.} = object  #
                                    #   Events.
                                    #
    width*, height*: cint
    mwidth*, mheight*: cint

  XRRScreenChangeNotifyEvent*{.final.} = object  # internal representation is private to the library
    typ*: cint               # event base
    serial*: culong          # # of last request processed by server
    send_event*: XBool        # true if this came from a SendEvent request
    display*: PDisplay       # Display the event was read from
    window*: Window          # window which selected for this event
    root*: Window            # Root window for changed screen
    timestamp*: Time         # when the screen change occurred
    config_timestamp*: Time  # when the last configuration change
    size_index*: SizeID
    subpixel_order*: SubpixelOrder
    rotation*: Rotation
    width*: cint
    height*: cint
    mwidth*: cint
    mheight*: cint

  PXRRScreenConfiguration* = ptr XRRScreenConfiguration
  XRRScreenConfiguration* {.final.} = object

  PXRRModeInfo* = ptr XRRModeInfo
  XRRModeInfo* {.final.} = object
    id*: RRMode
    width*, height*: cuint
    dotClock*: culong
    hSyncStart*, hSyncEnd*, hTotal*, hSkew*: cuint
    vSyncStart*, vSyncEnd*, vTotal*: cuint
    name*: cstring
    nameLength*: cuint
    modeFlags*: XRRModeFlags

  PXRRScreenResources* = ptr XRRScreenResources
  XRRScreenResources* {.final.} = object
    timestamp*, configTimestamp*: Time
    ncrtc*: cint
    crtcs*: ptr UncheckedArray[RRCrtc]
    noutput*: cint
    outputs*: ptr UncheckedArray[RROutput]
    nmode*: cint
    modes*: ptr UncheckedArray[XRRModeInfo]

  PXRROutputInfo* = ptr XRROutputInfo
  XRROutputInfo* {.final.} = object
    timestamp*: Time
    crtc*: RRCrtc
    name*: cstring
    nameLen*: cint
    mmWidth*, mmHeight*: culong
    connection*: Connection
    subpixelOrder*: SubpixelOrder
    ncrtc*: cint
    crtcs*: ptr UncheckedArray[RRCrtc]
    nclone*: cint
    clones*: ptr UncheckedArray[RROutput]
    nmode*, npreferred*: cint
    modes*: ptr UncheckedArray[RRMode]

  PXRRPropertyInfo* = ptr XRRPropertyInfo
  XRRPropertyInfo* {.final.} = object
    pending, range, immutable: bool
    numValues: cint
    values: ptr UncheckedArray[clong]

  RandrFormat* = enum
    randrFormat16bit = 16, randrFormat32bit = 32

{.deprecated: [TXRRScreenSize: XRRScreenSize].}
{.deprecated: [TXRRScreenChangeNotifyEvent: XRRScreenChangeNotifyEvent].}
{.deprecated: [TXRRScreenConfiguration: XRRScreenConfiguration].}
{.deprecated: [TXRRModeInfo: XRRModeInfo].}
{.deprecated: [TXRRScreenResources: XRRScreenResources].}
{.deprecated: [TXRROutputInfo: XRROutputInfo].}
{.deprecated: [TXRRPropertyInfo: XRRPropertyInfo].}

proc XRRQueryExtension*(dpy: PDisplay, event_basep, error_basep: Pcint): XBool{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRQueryVersion*(dpy: PDisplay, major_versionp: Pcint,
                      minor_versionp: Pcint): Status{.cdecl, dynlib: libXrandr,
    importc.}
proc XRRQueryOutputProperty*(dpy: PDisplay, output: RROutput, property: Atom):
    PXRRPropertyInfo {.cdecl, dynlib: libXrandr, importc.}
proc XRRChangeOutputProperty*(dpy: PDisplay, output: RROutput,
    property, kind: Atom, format, mode: cint, data: ptr cuchar, nelements: cint) {.
    cdecl, dynlib: libXrandr, importc.}
proc XRRGetScreenInfo*(dpy: PDisplay, draw: Drawable): PXRRScreenConfiguration{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRFreeScreenConfigInfo*(config: PXRRScreenConfiguration){.cdecl,
    dynlib: libXrandr, importc.}
  #
  #  Note that screen configuration changes are only permitted if the client can
  #  prove it has up to date configuration information.  We are trying to
  #  insist that it become possible for screens to change dynamically, so
  #  we want to ensure the client knows what it is talking about when requesting
  #  changes.
  #
proc XRRSetScreenConfig*(dpy: PDisplay, config: PXRRScreenConfiguration,
                         draw: Drawable, size_index: cint, rotation: Rotation,
                         timestamp: Time): Status{.cdecl, dynlib: libXrandr,
    importc.}
  # added in v1.1, sorry for the lame name
proc XRRSetScreenConfigAndRate*(dpy: PDisplay, config: PXRRScreenConfiguration,
                                draw: Drawable, size_index: cint,
                                rotation: Rotation, rate: cshort,
                                timestamp: Time): Status{.cdecl,
    dynlib: libXrandr, importc.}
proc XRRConfigRotations*(config: PXRRScreenConfiguration,
                         current_rotation: PRotation): Rotation{.cdecl,
    dynlib: libXrandr, importc.}
proc XRRConfigTimes*(config: PXRRScreenConfiguration, config_timestamp: PTime): Time{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRConfigSizes*(config: PXRRScreenConfiguration, nsizes: Pcint): PXRRScreenSize{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRConfigRates*(config: PXRRScreenConfiguration, sizeID: cint,
                     nrates: Pcint): ptr int16{.cdecl, dynlib: libXrandr, importc.}
proc XRRConfigCurrentConfiguration*(config: PXRRScreenConfiguration,
                                    rotation: PRotation): SizeID{.cdecl,
    dynlib: libXrandr, importc.}
proc XRRConfigCurrentRate*(config: PXRRScreenConfiguration): cshort{.cdecl,
    dynlib: libXrandr, importc.}
proc XRRRootToScreen*(dpy: PDisplay, root: Window): cint{.cdecl,
    dynlib: libXrandr, importc.}
  #
  #  returns the screen configuration for the specified screen; does a lazy
  #  evalution to delay getting the information, and caches the result.
  #  These routines should be used in preference to XRRGetScreenInfo
  #  to avoid unneeded round trips to the X server.  These are new
  #  in protocol version 0.1.
  #
proc XRRScreenConfig*(dpy: PDisplay, screen: cint): PXRRScreenConfiguration{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRConfig*(screen: PScreen): PXRRScreenConfiguration{.cdecl,
    dynlib: libXrandr, importc.}
proc XRRSelectInput*(dpy: PDisplay, window: Window, mask: cint){.cdecl,
    dynlib: libXrandr, importc.}
  #
  #  the following are always safe to call, even if RandR is not implemented
  #  on a screen
  #
proc XRRRotations*(dpy: PDisplay, screen: cint, current_rotation: PRotation): Rotation{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRSizes*(dpy: PDisplay, screen: cint, nsizes: Pcint): PXRRScreenSize{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRRates*(dpy: PDisplay, screen: cint, sizeID: cint, nrates: Pcint): ptr int16{.
    cdecl, dynlib: libXrandr, importc.}
proc XRRTimes*(dpy: PDisplay, screen: cint, config_timestamp: PTime): Time{.
    cdecl, dynlib: libXrandr, importc.}
  #
  #  intended to take RRScreenChangeNotify,  or
  #  ConfigureNotify (on the root window)
  #  returns 1 if it is an event type it understands, 0 if not
  #
proc XRRUpdateConfiguration*(event: PXEvent): cint{.cdecl, dynlib: libXrandr,
    importc.}
# implementation
proc XRRGetScreenResourcesCurrent*(dpy: PDisplay, win: Window):
    PXRRScreenResources {.cdecl, dynlib: libXrandr, importc.}
proc XRRFreeScreenResources*(res: PXRRScreenResources) {.cdecl,
    dynlib: libXrandr, importc.}
proc XRRGetOutputInfo*(dpy: PDisplay, res: PXRRScreenResources, ret: RROutput):
    PXRROutputInfo {.cdecl, dynlib: libXrandr, importc.}
proc XRRFreeOutputInfo*(info: PXRROutputInfo) {.cdecl, dynlib: libXrandr,
    importc.}
