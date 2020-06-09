# Converted from X11/Xft/Xft.h
import
  x,
  xlib,
  xrender,
  xutil

const
  xftLib = "libXft.so"

# Defined in the FreeType library
type
  FT_UInt* = cuint
  PFT_UInt* = ptr FT_UInt
  FT_Face* = object
  PFT_Face* = ptr FT_Face

# Defined in the fontconfig library
type
  FcEndian* = enum
    FcEndianBig, FcEndianLittle

  FcResult* = enum
    FcResultMatch, FcResultNoMatch, FcResultTypeMismatch,
    FcResultNoId, FcResultOutOfMemory
  PFcResult* = ptr FcResult

  FcBool* = cint

  FcCharSet* = object
  PFcCharSet* = ptr FcCharSet

  FcPattern* = object
  PFcPattern* = ptr FcPattern

  FcFontSet* = object
    nfont*: cint
    sfont*: cint
    fonts*: ptr PFcPattern
  PFcFontSet* = ptr FcFontSet

  FcChar8* = cuchar
  PFcChar8* = ptr FcChar8

  FcChar16* = cushort
  PFcChar16* = ptr FcChar16

  FcChar32* = cuint
  PFcChar32* = ptr FcChar32

type
  XftFontInfo* = object 
  PXftFontInfo* = ptr XftFontInfo
  XftFont* = object
    ascent*: cint
    descent*: cint
    height*: cint
    max_advance_width*: cint
    charset*: PFcCharSet
    pattern*: PFcPattern    
  PXftFont* = ptr XftFont

  XftDraw* = object
  PXftDraw* = ptr XftDraw

  XftColor* = object
    pixel*: culong
    color*: XRenderColor
  PXftColor* = ptr XftColor

  XftCharSpec* = object
    ucs4*: FcChar32
    x*: cshort
    y*: cshort
  PXftCharSpec* = ptr XftCharSpec

  XftCharFontSpec* = object
    font*: PXftFont
    ucs4*: FcChar32
    x*: cshort
    y*: cshort
  PXftCharFontSpec* = ptr XftCharFontSpec

  XftGlyphSpec* = object
    glyph*: FT_UInt
    x*: cshort
    y*: cshort
  PXftGlyphSpec* = ptr XftGlyphSpec

  XftGlyphFontSpec* = object
    font*: PXftFont
    glyph*: FT_UInt
    x*: cshort
    y*: cshort
  PXftGlyphFontSpec = ptr XftGlyphFontSpec

# xftcolor.c
proc XftColorAllocName*(
  display: PDisplay,
  visual: PVisual,
  cmap: Colormap,
  name: cstring,
  result: PXftColor
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftColorAllocValue*(
  display: PDisplay,
  visual: PVisual,
  cmap: Colormap,
  color: PXRenderColor,
  result: PXftColor
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftColorFree*(
  display: PDisplay,
  visual: PVisual,
  cmap: Colormap,
  color: PXftColor
) {.cdecl, dynlib: xftLib, importc.} 

# xftdpy.c
proc XftDefaultHasRender*(
  display: PDisplay
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftDefaultSet*(
  display: PDisplay,
  defaults: PFcPattern
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftDefaultSubstitute*(
  display: PDisplay,
  screen: cint,
  pattern: PFcPattern
) {.cdecl, dynlib: xftLib, importc.}

# xftdraw.c
proc XftDrawCreate*(
  display: PDisplay,
  drawable: Drawable,
  visual: PVisual,
  colormap: Colormap 
): PXftDraw {.cdecl, dynlib: xftLib, importc.}

proc XftDrawCreateBitmap*(
  display: PDisplay,
  bitmap: Pixmap
): PXftDraw {.cdecl, dynlib: xftLib, importc.}

proc XftDrawCreateAlpha*(
  display: PDisplay,
  pixmap: Pixmap,
  depth: cint
): PXftDraw {.cdecl, dynlib: xftLib, importc.}

proc XftDrawChange*(
  draw: PXftDraw,
  drawable: Drawable
) {.cdecl, dynlib: xftLib, importc.} 

proc XftDrawDisplay*(
  draw: PXftDraw
): PDisplay {.cdecl, dynlib: xftLib, importc.}

proc XftDrawDrawable*(
  draw: PXftDraw
): Drawable {.cdecl, dynlib: xftLib, importc.}

proc XftDrawColormap*(
  draw: PXftDraw
): Colormap {.cdecl, dynlib: xftLib, importc.}

proc XftDrawVisual*(
  draw: PXftDraw
): PVisual {.cdecl, dynlib: xftLib, importc.}

proc XftDrawDestroy*(
  draw: PXftDraw
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawPicture*(
  draw: PXftDraw
): Picture {.cdecl, dynlib: xftLib, importc.}

proc XftDrawSrcPicture*(
  draw: PXftDraw,
  color: PXftColor
): Picture {.cdecl, dynlib: xftLib, importc.}

proc XftDrawGlyphs*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  glyphs: PFt_UInt,
  nglyphs: cint
) {.cdecl, dynlib: xftLib, importc.} 

proc XftDrawString8*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawString16*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  str: PFcChar16,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawString32*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  str: PFcChar32,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawStringUtf8*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawStringUtf16*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawCharSpec*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  chars: PXftCharSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawCharFontSpec*(
  draw: PXftDraw,
  color: PXftColor,
  chars: PXftCharFontSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawGlyphSpec*(
  draw: PXftDraw,
  color: PXftColor,
  pub: PXftFont,
  glyphs: PXftGlyphSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawGlyphFontSpec*(
  draw: PXftDraw,
  color: PXftColor,
  glyphs: PXftGlyphFontSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawRect*(
  draw: PXftDraw,
  color: PXftColor,
  x: cint,
  y: cint,
  width: cuint,
  height: cuint
) {.cdecl, dynlib: xftLib, importc.}

proc XftDrawSetClip*(
  draw: PXftDraw,
  r: Region
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftDrawSetClipRectangles*(
  draw: PXftDraw,
  xOrigin: cint,
  yOrigin: cint,
  rects: PXRectangle,
  n: cint
): XBool {.cdecl, dynlib: xftLib, importc.}

proc XftDrawSetSubwindowMode*(
  draw: PXftDraw,
  mode: cint
) {.cdecl, dynlib: xftLib, importc.}

# xftextent.c
proc XftGlyphExtents*(
  display: PDisplay,
  pub: PXftFont,
  glyphs: PFT_UInt,
  nglyphs: cint,
  extends: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextExtents8*(
  display: PDisplay,
  pub: PXftFont,
  str: PFcChar8,
  len: cint,
  extents: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextExtents16*(
  display: PDisplay,
  pub: PXftFont,
  str: PFcChar16,
  len: cint,
  extents: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextExtents32*(
  display: PDisplay,
  pub: PXftFont,
  str: PFcChar32,
  len: cint,
  extents: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextExtentsUtf8*(
  display: PDisplay,
  pub: PXftFont,
  str: PFcChar8,
  len: cint,
  extents: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextExtentsUtf16*(
  display: PDisplay,
  pub: PXftFont,
  str: PFcChar8,
  endian: FcEndian,
  len: cint,
  extents: PXGlyphInfo
) {.cdecl, dynlib: xftLib, importc.}

# xftfont.c
proc XftFontMatch*(
  display: PDisplay,
  screen: cint,
  pattern: PFcPattern,
  result: PFcResult
): PFcPattern {.cdecl, dynlib: xftLib, importc.}

# Expects display to be nil as an argument
proc XftFontOpen*(
  display: PDisplay,
  screen: cint
): PXftFont {.cdecl, dynlib: xftLib, importc, varargs.}

proc XftFontOpenName*(
  display: PDisplay,
  screen: cint,
  name: cstring
): PXftFont {.cdecl, dynlib: xftLib, importc.}

proc XftFontOpenXlfd*(
  display: PDisplay,
  screen: cint,
  xlfd: cstring
): PXftFont {.cdecl, dynlib: xftLib, importc.}

# xftfreetype.c
proc XftLockFace*(
  pub: PXftFont
): FT_Face {.cdecl, dynlib: xftLib, importc.}

proc XftUnlockFace*(
  pub: PXftFont
) {.cdecl, dynlib: xftLib, importc.}

proc XftFontInfoCreate*(
  display: PDisplay,
  pattern: PFcPattern
): PXftFontInfo {.cdecl, dynlib: xftLib, importc.}

proc XftFontInfoDestroy*(
  display: PDisplay,
  fi: PXftFontInfo
) {.cdecl, dynlib: xftLib, importc.}

proc XftFontInfoHash*(
  fi: PXftFontInfo
): PFcChar32 {.cdecl, dynlib: xftLib, importc.}

proc XftFontInfoEqual*(
  a: PXftFontInfo,
  b: PXftFontInfo
): FcBool {.cdecl, dynlib: xftLib, importc.}

proc XftFontOpenInfo*(
  display: PDisplay,
  pattern: PFcPattern,
  fi: PXftFontInfo
): PXftFont {.cdecl, dynlib: xftLib, importc.}

proc XftFontOpenPattern*(
  display: PDisplay,
  pattern: PFcPattern
): PXftFont {.cdecl, dynlib: xftLib, importc.}

proc XftFontCopy*(
  display: PDisplay,
  pub: PXftFont
): PXftFont {.cdecl, dynlib: xftLib, importc.}

proc XftFontClose*(
  display: PDisplay,
  pub: PXftFont
) {.cdecl, dynlib: xftLib, importc.}

proc XftInitFtLibrary*(): FcBool {.cdecl, dynlib: xftLib, importc.}

# xftglyphs.c
proc XftFontLoadGlyphs*(
  display: PDisplay,
  pub: PXftFont,
  need_bitmaps: FcBool,
  glyphs: PFT_UInt,
  nglyph: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftFontUnloadGlyphs*(
  display: PDisplay,
  pub: PXftFont,
  glyphs: PFT_UInt,
  nglyph: cint
) {.cdecl, dynlib: xftLib, importc.}

const XFT_NMISSING* = 256

proc XftFontCheckGlyph*(
  display: PDisplay,
  pub: PXftFont,
  need_bitmaps: FcBool,
  glyph: FT_UInt,
  missing: PFT_UInt,
  nmissing: cint
): FcBool {.cdecl, dynlib: xftLib, importc.}

proc XftCharExists*(
  display: PDisplay,
  pub: PXftFont,
  ucs4: FcChar32
): FcBool {.cdecl, dynlib: xftLib, importc.}

proc XftCharIndex*(
  display: PDisplay,
  pub: PXftFont,
  ucs4: FcChar32
): FT_UInt {.cdecl, dynlib: xftLib, importc.}

# xftinit.c
proc XftInit*(
  config: cstring
): FcBool {.cdecl, dynlib: xftLib, importc.}

proc XftGetVersion*(): cint {.cdecl, dynlib: xftLib, importc.}

# xftlist.c
# Expects display to be nil as an argument
proc XftListFonts*(
  display: PDisplay,
  screen: cint
): PFcFontSet {.cdecl, dynlib: xftLib, importc, varargs.}

# xftname.c
proc XftNameParse*(
  name: cstring
): PFcPattern {.cdecl, dynlib: xftLib, importc.}

# xftrender.c
proc XftGlyphRender*(display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  glyphs: PFT_UInt,
  nglyphs: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftGlyphSpecRender*(display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  glyphs: PXftGlyphSpec,
  nglyphs: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftCharSpecRender*(display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  chars: PXftCharSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftGlyphFontSpecRender*(display: PDisplay,
  op: cint,
  src: Picture,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  glyphs: PXftGlyphFontSpec,
  nglyphs: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftCharFontSpecRender*(display: PDisplay,
  op: cint,
  src: Picture,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  chars: PXftCharFontSpec,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender8*(display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender16*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar16,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender16BE*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender16LE*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender32*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar32,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender32BE*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRender32LE*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRenderUtf8*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

proc XftTextRenderUtf16*(
  display: PDisplay,
  op: cint,
  src: Picture,
  pub: PXftFont,
  dst: Picture,
  srcx: cint,
  srcy: cint,
  x: cint,
  y: cint,
  str: PFcChar8,
  endian: FcEndian,
  len: cint
) {.cdecl, dynlib: xftLib, importc.}

# xftxlfd.c
proc XftXlfdParse8*(
  xlfd_orig: cstring,
  ignore_scalable: XBool,
  complete: XBool
): PFcPattern {.cdecl, dynlib: xftLib, importc.}

