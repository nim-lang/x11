# Converted from X11/Xinerama.h
import
  xlib

const
  xineramaLib = "libXinerama.so"

type
  PXineramaScreenInfo* = ptr XineramaScreenInfo
  XineramaScreenInfo*{.final.} = object
    screen_number*: cint
    x_org*: int16
    y_org*: int16
    width*: int16
    height*: int16

{.deprecated: [TXineramaScreenInfo: XineramaScreenInfo].}

proc XineramaQueryExtension*(dpy: PDisplay, event_base: Pcint, error_base: Pcint): XBool{.
    cdecl, dynlib: xineramaLib, importc.}
proc XineramaQueryVersion*(dpy: PDisplay, major: Pcint, minor: Pcint): Status{.
    cdecl, dynlib: xineramaLib, importc.}
proc XineramaIsActive*(dpy: PDisplay): XBool{.cdecl, dynlib: xineramaLib, importc.}
proc XineramaQueryScreens*(dpy: PDisplay, number: Pcint): PXineramaScreenInfo{.
    cdecl, dynlib: xineramaLib, importc.}

