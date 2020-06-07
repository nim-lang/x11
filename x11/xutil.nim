
import
  x, xlib, keysym

#const
#  libX11* = "libX11.so"

#
#  Automatically converted by H2Pas 0.99.15 from xutil.h
#  The following command line parameters were used:
#    -p
#    -T
#    -S
#    -d
#    -c
#    xutil.h
#

const
  NoValue* = 0x00000000
  XValue* = 0x00000001
  YValue* = 0x00000002
  WidthValue* = 0x00000004
  HeightValue* = 0x00000008
  AllValues* = 0x0000000F
  XNegative* = 0x00000010
  YNegative* = 0x00000020

type
  CPoint*{.final.} = object
    x*: cint
    y*: cint

  PXSizeHints* = ptr XSizeHints
  XSizeHints*{.final.} = object
    flags*: clong
    x*, y*: cint
    width*, height*: cint
    min_width*, min_height*: cint
    max_width*, max_height*: cint
    width_inc*, height_inc*: cint
    min_aspect*, max_aspect*: CPoint
    base_width*, base_height*: cint
    win_gravity*: cint

{.deprecated: [TCPoint: CPoint].}
{.deprecated: [TXSizeHints: XSizeHints].}

const
  USPosition* = 1 shl 0
  USSize* = 1 shl 1
  PPosition* = 1 shl 2
  PSize* = 1 shl 3
  PMinSize* = 1 shl 4
  PMaxSize* = 1 shl 5
  PResizeInc* = 1 shl 6
  PAspect* = 1 shl 7
  PBaseSize* = 1 shl 8
  PWinGravity* = 1 shl 9
  PAllHints* = PPosition or PSize or PMinSize or PMaxSize or PResizeInc or
      PAspect

type
  PXWMHints* = ptr XWMHints
  XWMHints*{.final.} = object
    flags*: clong
    input*: XBool
    initial_state*: cint
    icon_pixmap*: Pixmap
    icon_window*: Window
    icon_x*, icon_y*: cint
    icon_mask*: Pixmap
    window_group*: XID

{.deprecated: [TXWMHints: XWMHints].}


const
  InputHint* = 1 shl 0
  StateHint* = 1 shl 1
  IconPixmapHint* = 1 shl 2
  IconWindowHint* = 1 shl 3
  IconPositionHint* = 1 shl 4
  IconMaskHint* = 1 shl 5
  WindowGroupHint* = 1 shl 6
  AllHints* = InputHint or StateHint or IconPixmapHint or IconWindowHint or
      IconPositionHint or IconMaskHint or WindowGroupHint
  XUrgencyHint* = 1 shl 8
  WithdrawnState* = 0
  NormalState* = 1
  IconicState* = 3
  DontCareState* = 0
  ZoomState* = 2
  InactiveState* = 4

type
  PXTextProperty* = ptr XTextProperty
  XTextProperty*{.final.} = object
    value*: Pcuchar
    encoding*: Atom
    format*: cint
    nitems*: culong

{.deprecated: [TXTextProperty: XTextProperty].}


const
  XNoMemory* = - 1
  XLocaleNotSupported* = - 2
  XConverterNotFound* = - 3

type
  PXICCEncodingStyle* = ptr XICCEncodingStyle
  XICCEncodingStyle* = enum
    XStringStyle, XCompoundTextStyle, XTextStyle, XStdICCTextStyle,
    XUTF8StringStyle

  PPXIconSize* = ptr PXIconSize
  PXIconSize* = ptr XIconSize
  XIconSize*{.final.} = object
    min_width*, min_height*: cint
    max_width*, max_height*: cint
    width_inc*, height_inc*: cint

  PXClassHint* = ptr XClassHint
  XClassHint*{.final.} = object
    res_name*: cstring
    res_class*: cstring

{.deprecated: [TXICCEncodingStyle: XICCEncodingStyle].}
{.deprecated: [TXIconSize: XIconSize].}
{.deprecated: [TXClassHint: XClassHint].}

type
  PXComposeStatus* = ptr XComposeStatus
  XComposeStatus*{.final.} = object
    compose_ptr*: XPointer
    chars_matched*: cint

{.deprecated: [TXComposeStatus: XComposeStatus].}


type
  PXRegion* = ptr XRegion
  XRegion*{.final.} = object

  PRegion* = ptr Region
  Region* = PXRegion

{.deprecated: [TXRegion: XRegion].}
{.deprecated: [TRegion: Region].}

const
  RectangleOut* = 0
  RectangleIn* = 1
  RectanglePart* = 2

type
  PXVisualInfo* = ptr XVisualInfo
  XVisualInfo*{.final.} = object
    visual*: PVisual
    visualid*: VisualID
    screen*: cint
    depth*: cint
    class*: cint
    red_mask*: culong
    green_mask*: culong
    blue_mask*: culong
    colormap_size*: cint
    bits_per_rgb*: cint

{.deprecated: [TXVisualInfo: XVisualInfo].}


const
  VisualNoMask* = 0x00000000
  VisualIDMask* = 0x00000001
  VisualScreenMask* = 0x00000002
  VisualDepthMask* = 0x00000004
  VisualClassMask* = 0x00000008
  VisualRedMaskMask* = 0x00000010
  VisualGreenMaskMask* = 0x00000020
  VisualBlueMaskMask* = 0x00000040
  VisualColormapSizeMask* = 0x00000080
  VisualBitsPerRGBMask* = 0x00000100
  VisualAllMask* = 0x000001FF

type
  PPXStandardColormap* = ptr PXStandardColormap
  PXStandardColormap* = ptr XStandardColormap
  XStandardColormap*{.final.} = object
    colormap*: Colormap
    red_max*: culong
    red_mult*: culong
    green_max*: culong
    green_mult*: culong
    blue_max*: culong
    blue_mult*: culong
    base_pixel*: culong
    visualid*: VisualID
    killid*: XID

{.deprecated: [TXStandardColormap: XStandardColormap].}


const
  BitmapSuccess* = 0
  BitmapOpenFailed* = 1
  BitmapFileInvalid* = 2
  BitmapNoMemory* = 3
  XCSUCCESS* = 0
  XCNOMEM* = 1
  XCNOENT* = 2
  ReleaseByFreeingColormap*: XID = XID(1)

type
  PXContext* = ptr XContext
  XContext* = cint

{.deprecated: [TXContext: XContext].}

proc XAllocClassHint*(): PXClassHint{.cdecl, dynlib: libX11, importc.}
proc XAllocIconSize*(): PXIconSize{.cdecl, dynlib: libX11, importc.}
proc XAllocSizeHints*(): PXSizeHints{.cdecl, dynlib: libX11, importc.}
proc XAllocStandardColormap*(): PXStandardColormap{.cdecl, dynlib: libX11,
    importc.}
proc XAllocWMHints*(): PXWMHints{.cdecl, dynlib: libX11, importc.}
proc XClipBox*(para1: Region, para2: PXRectangle): cint{.cdecl, dynlib: libX11,
    importc.}
proc XCreateRegion*(): Region{.cdecl, dynlib: libX11, importc.}
proc XDefaultString*(): cstring{.cdecl, dynlib: libX11, importc.}
proc XDeleteContext*(para1: PDisplay, para2: XID, para3: XContext): cint{.
    cdecl, dynlib: libX11, importc.}
proc XDestroyRegion*(para1: Region): cint{.cdecl, dynlib: libX11, importc.}
proc XEmptyRegion*(para1: Region): cint{.cdecl, dynlib: libX11, importc.}
proc XEqualRegion*(para1: Region, para2: Region): cint{.cdecl, dynlib: libX11,
    importc.}
proc XFindContext*(para1: PDisplay, para2: XID, para3: XContext,
                   para4: PXPointer): cint{.cdecl, dynlib: libX11, importc.}
proc XGetClassHint*(para1: PDisplay, para2: Window, para3: PXClassHint): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetIconSizes*(para1: PDisplay, para2: Window, para3: PPXIconSize,
                    para4: Pcint): Status{.cdecl, dynlib: libX11, importc.}
proc XGetNormalHints*(para1: PDisplay, para2: Window, para3: PXSizeHints): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetRGBColormaps*(para1: PDisplay, para2: Window,
                       para3: PPXStandardColormap, para4: Pcint, para5: Atom): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetSizeHints*(para1: PDisplay, para2: Window, para3: PXSizeHints,
                    para4: Atom): Status{.cdecl, dynlib: libX11, importc.}
proc XGetStandardColormap*(para1: PDisplay, para2: Window,
                           para3: PXStandardColormap, para4: Atom): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetTextProperty*(para1: PDisplay, para2: Window, para3: PXTextProperty,
                       para4: Atom): Status{.cdecl, dynlib: libX11, importc.}
proc XGetVisualInfo*(para1: PDisplay, para2: clong, para3: PXVisualInfo,
                     para4: Pcint): PXVisualInfo{.cdecl, dynlib: libX11, importc.}
proc XGetWMClientMachine*(para1: PDisplay, para2: Window, para3: PXTextProperty): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetWMHints*(para1: PDisplay, para2: Window): PXWMHints{.cdecl,
    dynlib: libX11, importc.}
proc XGetWMIconName*(para1: PDisplay, para2: Window, para3: PXTextProperty): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetWMName*(para1: PDisplay, para2: Window, para3: PXTextProperty): Status{.
    cdecl, dynlib: libX11, importc.}
proc XGetWMNormalHints*(para1: PDisplay, para2: Window, para3: PXSizeHints,
                        para4: ptr int): Status{.cdecl, dynlib: libX11, importc.}
proc XGetWMSizeHints*(para1: PDisplay, para2: Window, para3: PXSizeHints,
                      para4: ptr int, para5: Atom): Status{.cdecl,
    dynlib: libX11, importc.}
proc XGetZoomHints*(para1: PDisplay, para2: Window, para3: PXSizeHints): Status{.
    cdecl, dynlib: libX11, importc.}
proc XIntersectRegion*(para1: Region, para2: Region, para3: Region): cint{.
    cdecl, dynlib: libX11, importc.}
proc XConvertCase*(para1: KeySym, para2: PKeySym, para3: PKeySym){.cdecl,
    dynlib: libX11, importc.}
proc XLookupString*(para1: PXKeyEvent, para2: cstring, para3: cint,
                    para4: PKeySym, para5: PXComposeStatus): cint{.cdecl,
    dynlib: libX11, importc.}
proc XMatchVisualInfo*(para1: PDisplay, para2: cint, para3: cint, para4: cint,
                       para5: PXVisualInfo): Status{.cdecl, dynlib: libX11,
    importc.}
proc XOffsetRegion*(para1: Region, para2: cint, para3: cint): cint{.cdecl,
    dynlib: libX11, importc.}
proc XPointInRegion*(para1: Region, para2: cint, para3: cint): XBool{.cdecl,
    dynlib: libX11, importc.}
proc XPolygonRegion*(para1: PXPoint, para2: cint, para3: cint): Region{.cdecl,
    dynlib: libX11, importc.}
proc XRectInRegion*(para1: Region, para2: cint, para3: cint, para4: cuint,
                    para5: cuint): cint{.cdecl, dynlib: libX11, importc.}
proc XSaveContext*(para1: PDisplay, para2: XID, para3: XContext,
                   para4: cstring): cint{.cdecl, dynlib: libX11, importc.}
proc XSetClassHint*(para1: PDisplay, para2: Window, para3: PXClassHint): cint{.
    cdecl, dynlib: libX11, importc.}
proc XSetIconSizes*(para1: PDisplay, para2: Window, para3: PXIconSize,
                    para4: cint): cint{.cdecl, dynlib: libX11, importc.}
proc XSetNormalHints*(para1: PDisplay, para2: Window, para3: PXSizeHints): cint{.
    cdecl, dynlib: libX11, importc.}
proc XSetRGBColormaps*(para1: PDisplay, para2: Window,
                       para3: PXStandardColormap, para4: cint, para5: Atom){.
    cdecl, dynlib: libX11, importc.}
proc XSetSizeHints*(para1: PDisplay, para2: Window, para3: PXSizeHints,
                    para4: Atom): cint{.cdecl, dynlib: libX11, importc.}
proc XSetStandardProperties*(para1: PDisplay, para2: Window, para3: cstring,
                             para4: cstring, para5: Pixmap, para6: PPchar,
                             para7: cint, para8: PXSizeHints): cint{.cdecl,
    dynlib: libX11, importc.}
proc XSetTextProperty*(para1: PDisplay, para2: Window, para3: PXTextProperty,
                       para4: Atom){.cdecl, dynlib: libX11, importc.}
proc XSetWMClientMachine*(para1: PDisplay, para2: Window, para3: PXTextProperty){.
    cdecl, dynlib: libX11, importc.}
proc XSetWMHints*(para1: PDisplay, para2: Window, para3: PXWMHints): cint{.
    cdecl, dynlib: libX11, importc.}
proc XSetWMIconName*(para1: PDisplay, para2: Window, para3: PXTextProperty){.
    cdecl, dynlib: libX11, importc.}
proc XSetWMName*(para1: PDisplay, para2: Window, para3: PXTextProperty){.cdecl,
    dynlib: libX11, importc.}
proc XSetWMNormalHints*(para1: PDisplay, para2: Window, para3: PXSizeHints){.
    cdecl, dynlib: libX11, importc.}
proc XSetWMProperties*(para1: PDisplay, para2: Window, para3: PXTextProperty,
                       para4: PXTextProperty, para5: PPchar, para6: cint,
                       para7: PXSizeHints, para8: PXWMHints, para9: PXClassHint){.
    cdecl, dynlib: libX11, importc.}
proc XmbSetWMProperties*(para1: PDisplay, para2: Window, para3: cstring,
                         para4: cstring, para5: PPchar, para6: cint,
                         para7: PXSizeHints, para8: PXWMHints,
                         para9: PXClassHint){.cdecl, dynlib: libX11, importc.}
proc Xutf8SetWMProperties*(para1: PDisplay, para2: Window, para3: cstring,
                           para4: cstring, para5: PPchar, para6: cint,
                           para7: PXSizeHints, para8: PXWMHints,
                           para9: PXClassHint){.cdecl, dynlib: libX11, importc.}
proc XSetWMSizeHints*(para1: PDisplay, para2: Window, para3: PXSizeHints,
                      para4: Atom){.cdecl, dynlib: libX11, importc.}
proc XSetRegion*(para1: PDisplay, para2: GC, para3: Region): cint{.cdecl,
    dynlib: libX11, importc.}
proc XSetStandardColormap*(para1: PDisplay, para2: Window,
                           para3: PXStandardColormap, para4: Atom){.cdecl,
    dynlib: libX11, importc.}
proc XSetZoomHints*(para1: PDisplay, para2: Window, para3: PXSizeHints): cint{.
    cdecl, dynlib: libX11, importc.}
proc XShrinkRegion*(para1: Region, para2: cint, para3: cint): cint{.cdecl,
    dynlib: libX11, importc.}
proc XStringListToTextProperty*(para1: PPchar, para2: cint,
                                para3: PXTextProperty): Status{.cdecl,
    dynlib: libX11, importc.}
proc XSubtractRegion*(para1: Region, para2: Region, para3: Region): cint{.
    cdecl, dynlib: libX11, importc.}
proc XmbTextListToTextProperty*(para1: PDisplay, para2: PPchar, para3: cint,
                                para4: XICCEncodingStyle, para5: PXTextProperty): cint{.
    cdecl, dynlib: libX11, importc.}
proc XwcTextListToTextProperty*(para1: PDisplay, para2: ptr ptr int16, para3: cint,
                                para4: XICCEncodingStyle, para5: PXTextProperty): cint{.
    cdecl, dynlib: libX11, importc.}
proc Xutf8TextListToTextProperty*(para1: PDisplay, para2: PPchar, para3: cint,
                                  para4: XICCEncodingStyle,
                                  para5: PXTextProperty): cint{.cdecl,
    dynlib: libX11, importc.}
proc XwcFreeStringList*(para1: ptr ptr int16){.cdecl, dynlib: libX11, importc.}
proc XTextPropertyToStringList*(para1: PXTextProperty, para2: PPPchar,
                                para3: Pcint): Status{.cdecl, dynlib: libX11,
    importc.}
proc XmbTextPropertyToTextList*(para1: PDisplay, para2: PXTextProperty,
                                para3: PPPchar, para4: Pcint): cint{.cdecl,
    dynlib: libX11, importc.}
proc XwcTextPropertyToTextList*(para1: PDisplay, para2: PXTextProperty,
                                para3: ptr ptr ptr int16, para4: Pcint): cint{.cdecl,
    dynlib: libX11, importc.}
proc Xutf8TextPropertyToTextList*(para1: PDisplay, para2: PXTextProperty,
                                  para3: PPPchar, para4: Pcint): cint{.cdecl,
    dynlib: libX11, importc.}
proc XUnionRectWithRegion*(para1: PXRectangle, para2: Region, para3: Region): cint{.
    cdecl, dynlib: libX11, importc.}
proc XUnionRegion*(para1: Region, para2: Region, para3: Region): cint{.cdecl,
    dynlib: libX11, importc.}
proc XWMGeometry*(para1: PDisplay, para2: cint, para3: cstring, para4: cstring,
                  para5: cuint, para6: PXSizeHints, para7: Pcint, para8: Pcint,
                  para9: Pcint, para10: Pcint, para11: Pcint): cint{.cdecl,
    dynlib: libX11, importc.}
proc XXorRegion*(para1: Region, para2: Region, para3: Region): cint{.cdecl,
    dynlib: libX11, importc.}
#when defined(MACROS):
proc XDestroyImage*(ximage: PXImage): cint
proc XGetPixel*(ximage: PXImage, x, y: cint): culong
proc XPutPixel*(ximage: PXImage, x, y: cint, pixel: culong): cint
proc XSubImage*(ximage: PXImage, x, y: cint, width, height: cuint): PXImage
proc XAddPixel*(ximage: PXImage, value: clong): cint
proc IsKeypadKey*(keysym: KeySym): bool
proc IsPrivateKeypadKey*(keysym: KeySym): bool
proc IsCursorKey*(keysym: KeySym): bool
proc IsPFKey*(keysym: KeySym): bool
proc IsFunctionKey*(keysym: KeySym): bool
proc IsMiscFunctionKey*(keysym: KeySym): bool
proc IsModifierKey*(keysym: KeySym): bool
  #function XUniqueContext : XContext;
  #function XStringToContext(_string : Pchar) : XContext;
# implementation

#when defined(MACROS):
proc XDestroyImage(ximage: PXImage): cint =
  ximage.f.destroy_image(ximage)

proc XGetPixel(ximage: PXImage, x, y: cint): culong =
  ximage.f.get_pixel(ximage, x, y)

proc XPutPixel(ximage: PXImage, x, y: cint, pixel: culong): cint =
  ximage.f.put_pixel(ximage, x, y, pixel)

proc XSubImage(ximage: PXImage, x, y: cint, width, height: cuint): PXImage =
  ximage.f.sub_image(ximage, x, y, width, height)

proc XAddPixel(ximage: PXImage, value: clong): cint =
  ximage.f.add_pixel(ximage, value)

proc IsKeypadKey(keysym: KeySym): bool =
  (keysym >= XK_KP_Space) and (keysym <= XK_KP_Equal)

proc IsPrivateKeypadKey(keysym: KeySym): bool =
  (keysym >= 0x11000000.KeySym) and (keysym <= 0x1100FFFF.KeySym)

proc IsCursorKey(keysym: KeySym): bool =
  (keysym >= XK_Home) and (keysym < XK_Select)

proc IsPFKey(keysym: KeySym): bool =
  (keysym >= XK_KP_F1) and (keysym <= XK_KP_F4)

proc IsFunctionKey(keysym: KeySym): bool =
  (keysym >= XK_F1) and (keysym <= XK_F35)

proc IsMiscFunctionKey(keysym: KeySym): bool =
  (keysym >= XK_Select) and (keysym <= XK_Break)

proc IsModifierKey(keysym: KeySym): bool =
  ((keysym >= XK_Shift_L) and (keysym <= XK_Hyper_R)) or
      (keysym == XK_Mode_switch) or (keysym == XK_Num_Lock)
