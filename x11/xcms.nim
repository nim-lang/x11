import
  x, xlib

#const
#  libX11* = "X11"

#
#  Automatically converted by H2Pas 0.99.15 from xcms.h
#  The following command line parameters were used:
#    -p
#    -T
#    -S
#    -d
#    -c
#    xcms.h
#

const
  XcmsFailure* = 0
  XcmsSuccess* = 1
  XcmsSuccessWithCompression* = 2

type
  PXcmsColorFormat* = ptr XcmsColorFormat
  XcmsColorFormat* = int32

{.deprecated: [TXcmsColorFormat: XcmsColorFormat].}

proc XcmsUndefinedFormat*(): XcmsColorFormat
proc XcmsCIEXYZFormat*(): XcmsColorFormat
proc XcmsCIEuvYFormat*(): XcmsColorFormat
proc XcmsCIExyYFormat*(): XcmsColorFormat
proc XcmsCIELabFormat*(): XcmsColorFormat
proc XcmsCIELuvFormat*(): XcmsColorFormat
proc XcmsTekHVCFormat*(): XcmsColorFormat
proc XcmsRGBFormat*(): XcmsColorFormat
proc XcmsRGBiFormat*(): XcmsColorFormat
const
  XcmsInitNone* = 0x00000000
  XcmsInitSuccess* = 0x00000001
  XcmsInitFailure* = 0x000000FF

type
  PXcmsFloat* = ptr XcmsFloat
  XcmsFloat* = float64
  PXcmsRGB* = ptr XcmsRGB
  XcmsRGB*{.final.} = object
    red*: int16
    green*: int16
    blue*: int16

  PXcmsRGBi* = ptr XcmsRGBi
  XcmsRGBi*{.final.} = object
    red*: XcmsFloat
    green*: XcmsFloat
    blue*: XcmsFloat

  PXcmsCIEXYZ* = ptr XcmsCIEXYZ
  XcmsCIEXYZ*{.final.} = object
    X*: XcmsFloat
    Y*: XcmsFloat
    Z*: XcmsFloat

  PXcmsCIEuvY* = ptr XcmsCIEuvY
  XcmsCIEuvY*{.final.} = object
    u_prime*: XcmsFloat
    v_prime*: XcmsFloat
    Y*: XcmsFloat

  PXcmsCIExyY* = ptr XcmsCIExyY
  XcmsCIExyY*{.final.} = object
    x*: XcmsFloat
    y*: XcmsFloat
    theY*: XcmsFloat

  PXcmsCIELab* = ptr XcmsCIELab
  XcmsCIELab*{.final.} = object
    L_star*: XcmsFloat
    a_star*: XcmsFloat
    b_star*: XcmsFloat

  PXcmsCIELuv* = ptr XcmsCIELuv
  XcmsCIELuv*{.final.} = object
    L_star*: XcmsFloat
    u_star*: XcmsFloat
    v_star*: XcmsFloat

  PXcmsTekHVC* = ptr XcmsTekHVC
  XcmsTekHVC*{.final.} = object
    H*: XcmsFloat
    V*: XcmsFloat
    C*: XcmsFloat

  PXcmsPad* = ptr XcmsPad
  XcmsPad*{.final.} = object
    pad0*: XcmsFloat
    pad1*: XcmsFloat
    pad2*: XcmsFloat
    pad3*: XcmsFloat

  PXcmsColor* = ptr XcmsColor
  XcmsColor*{.final.} = object   # spec : record
                                 #            case longint of
                                 #               0 : ( RGB : XcmsRGB );
                                 #               1 : ( RGBi : XcmsRGBi );
                                 #               2 : ( CIEXYZ : XcmsCIEXYZ );
                                 #               3 : ( CIEuvY : XcmsCIEuvY );
                                 #               4 : ( CIExyY : XcmsCIExyY );
                                 #               5 : ( CIELab : XcmsCIELab );
                                 #               6 : ( CIELuv : XcmsCIELuv );
                                 #               7 : ( TekHVC : XcmsTekHVC );
                                 #               8 : ( Pad : XcmsPad );
                                 #            end;
    pad*: XcmsPad
    pixel*: int32
    format*: XcmsColorFormat

  PXcmsPerScrnInfo* = ptr XcmsPerScrnInfo
  XcmsPerScrnInfo*{.final.} = object
    screenWhitePt*: XcmsColor
    functionSet*: XPointer
    screenData*: XPointer
    state*: int8
    pad*: array[0..2, char]

  PXcmsCCC* = ptr XcmsCCC
  XcmsCompressionProc* = proc (para1: PXcmsCCC, para2: PXcmsColor,
                                para3: int32, para4: int32, para5: PBool): Status{.
      cdecl.}
  XcmsWhiteAdjustProc* = proc (para1: PXcmsCCC, para2: PXcmsColor,
                                para3: PXcmsColor, para4: XcmsColorFormat,
                                para5: PXcmsColor, para6: int32, para7: PBool): Status{.
      cdecl.}
  XcmsCCC*{.final.} = object
    dpy*: PDisplay
    screenNumber*: int32
    visual*: PVisual
    clientWhitePt*: XcmsColor
    gamutCompProc*: XcmsCompressionProc
    gamutCompClientData*: XPointer
    whitePtAdjProc*: XcmsWhiteAdjustProc
    whitePtAdjClientData*: XPointer
    pPerScrnInfo*: PXcmsPerScrnInfo

  PXcmsCCCRec* = ptr XcmsCCCRec
  XcmsCCCRec* = XcmsCCC

  XcmsScreenInitProc* = proc (para1: PDisplay, para2: int32,
                               para3: PXcmsPerScrnInfo): Status{.cdecl.}
  XcmsScreenFreeProc* = proc (para1: XPointer){.cdecl.}

  XcmsConversionProc* = proc (){.cdecl.}

  PXcmsFuncListPtr* = ptr XcmsFuncListPtr
  XcmsFuncListPtr* = XcmsConversionProc

  XcmsParseStringProc* = proc (para1: cstring, para2: PXcmsColor): int32{.cdecl.}

  PXcmsColorSpace* = ptr XcmsColorSpace
  XcmsColorSpace*{.final.} = object
    prefix*: cstring
    id*: XcmsColorFormat
    parseString*: XcmsParseStringProc
    to_CIEXYZ*: XcmsFuncListPtr
    from_CIEXYZ*: XcmsFuncListPtr
    inverse_flag*: int32

  PXcmsFunctionSet* = ptr XcmsFunctionSet
  XcmsFunctionSet*{.final.} = object   # error
                                       # extern Status XcmsAddColorSpace (
                                       # in declaration at line 323
    DDColorSpaces*: ptr PXcmsColorSpace
    screenInitProc*: XcmsScreenInitProc
    screenFreeProc*: XcmsScreenFreeProc

{.deprecated: [TXcmsRGB: XcmsRGB].}
{.deprecated: [TXcmsRGBi: XcmsRGBi].}
{.deprecated: [TXcmsCIEXYZ: XcmsCIEXYZ].}
{.deprecated: [TXcmsCIEuvY: XcmsCIEuvY].}
{.deprecated: [TXcmsCIExyY: XcmsCIExyY].}
{.deprecated: [TXcmsCIELab: XcmsCIELab].}
{.deprecated: [TXcmsCIELuv: XcmsCIELuv].}
{.deprecated: [TXcmsTekHVC: XcmsTekHVC].}
{.deprecated: [TXcmsPad: XcmsPad].}
{.deprecated: [TXcmsColor: XcmsColor].}
{.deprecated: [TXcmsPerScrnInfo: XcmsPerScrnInfo].}
{.deprecated: [TXcmsCompressionProc: XcmsCompressionProc].}
{.deprecated: [TXcmsWhiteAdjustProc: XcmsWhiteAdjustProc].}
{.deprecated: [TXcmsCCC: XcmsCCC].}
{.deprecated: [TXcmsCCCRec: XcmsCCCRec].}
{.deprecated: [TXcmsScreenInitProc: XcmsScreenInitProc].}
{.deprecated: [TXcmsScreenFreeProc: XcmsScreenFreeProc].}
{.deprecated: [TXcmsConversionProc: XcmsConversionProc].}
{.deprecated: [TXcmsFuncListPtr: XcmsFuncListPtr].}
{.deprecated: [TXcmsParseStringProc: XcmsParseStringProc].}
{.deprecated: [TXcmsColorSpace: XcmsColorSpace].}
{.deprecated: [TXcmsFunctionSet: XcmsFunctionSet].}

proc XcmsAddFunctionSet*(para1: PXcmsFunctionSet): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsAllocColor*(para1: PDisplay, para2: Colormap, para3: PXcmsColor,
                     para4: XcmsColorFormat): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsAllocNamedColor*(para1: PDisplay, para2: Colormap, para3: cstring,
                          para4: PXcmsColor, para5: PXcmsColor,
                          para6: XcmsColorFormat): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCCCOfColormap*(para1: PDisplay, para2: Colormap): XcmsCCC{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELabClipab*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                       para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELabClipL*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                      para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELabClipLab*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                        para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELabQueryMaxC*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELabQueryMaxL*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELabQueryMaxLC*(para1: XcmsCCC, para2: XcmsFloat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsCIELabQueryMinL*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELabToCIEXYZ*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIELabWhiteShiftColors*(para1: XcmsCCC, para2: PXcmsColor,
                                 para3: PXcmsColor, para4: XcmsColorFormat,
                                 para5: PXcmsColor, para6: int32, para7: PBool): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsCIELuvClipL*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                      para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELuvClipLuv*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                        para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELuvClipuv*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                       para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCIELuvQueryMaxC*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELuvQueryMaxL*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELuvQueryMaxLC*(para1: XcmsCCC, para2: XcmsFloat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsCIELuvQueryMinL*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsCIELuvToCIEuvY*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIELuvWhiteShiftColors*(para1: XcmsCCC, para2: PXcmsColor,
                                 para3: PXcmsColor, para4: XcmsColorFormat,
                                 para5: PXcmsColor, para6: int32, para7: PBool): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsCIEXYZToCIELab*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEXYZToCIEuvY*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEXYZToCIExyY*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEXYZToRGBi*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                       para4: PBool): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEuvYToCIELuv*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEuvYToCIEXYZ*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIEuvYToTekHVC*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsCIExyYToCIEXYZ*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsClientWhitePointOfCCC*(para1: XcmsCCC): PXcmsColor{.cdecl,
    dynlib: libX11, importc.}
proc XcmsConvertColors*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                        para4: XcmsColorFormat, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsCreateCCC*(para1: PDisplay, para2: int32, para3: PVisual,
                    para4: PXcmsColor, para5: XcmsCompressionProc,
                    para6: XPointer, para7: XcmsWhiteAdjustProc,
                    para8: XPointer): XcmsCCC{.cdecl, dynlib: libX11, importc.}
proc XcmsDefaultCCC*(para1: PDisplay, para2: int32): XcmsCCC{.cdecl,
    dynlib: libX11, importc.}
proc XcmsDisplayOfCCC*(para1: XcmsCCC): PDisplay{.cdecl, dynlib: libX11,
    importc.}
proc XcmsFormatOfPrefix*(para1: cstring): XcmsColorFormat{.cdecl,
    dynlib: libX11, importc.}
proc XcmsFreeCCC*(para1: XcmsCCC){.cdecl, dynlib: libX11, importc.}
proc XcmsLookupColor*(para1: PDisplay, para2: Colormap, para3: cstring,
                      para4: PXcmsColor, para5: PXcmsColor,
                      para6: XcmsColorFormat): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsPrefixOfFormat*(para1: XcmsColorFormat): cstring{.cdecl,
    dynlib: libX11, importc.}
proc XcmsQueryBlack*(para1: XcmsCCC, para2: XcmsColorFormat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsQueryBlue*(para1: XcmsCCC, para2: XcmsColorFormat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsQueryColor*(para1: PDisplay, para2: Colormap, para3: PXcmsColor,
                     para4: XcmsColorFormat): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsQueryColors*(para1: PDisplay, para2: Colormap, para3: PXcmsColor,
                      para4: int32, para5: XcmsColorFormat): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsQueryGreen*(para1: XcmsCCC, para2: XcmsColorFormat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsQueryRed*(para1: XcmsCCC, para2: XcmsColorFormat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsQueryWhite*(para1: XcmsCCC, para2: XcmsColorFormat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsRGBiToCIEXYZ*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                       para4: PBool): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsRGBiToRGB*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                    para4: PBool): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsRGBToRGBi*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                    para4: PBool): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsScreenNumberOfCCC*(para1: XcmsCCC): int32{.cdecl, dynlib: libX11,
    importc.}
proc XcmsScreenWhitePointOfCCC*(para1: XcmsCCC): PXcmsColor{.cdecl,
    dynlib: libX11, importc.}
proc XcmsSetCCCOfColormap*(para1: PDisplay, para2: Colormap, para3: XcmsCCC): XcmsCCC{.
    cdecl, dynlib: libX11, importc.}
proc XcmsSetCompressionProc*(para1: XcmsCCC, para2: XcmsCompressionProc,
                             para3: XPointer): XcmsCompressionProc{.cdecl,
    dynlib: libX11, importc.}
proc XcmsSetWhiteAdjustProc*(para1: XcmsCCC, para2: XcmsWhiteAdjustProc,
                             para3: XPointer): XcmsWhiteAdjustProc{.cdecl,
    dynlib: libX11, importc.}
proc XcmsSetWhitePoint*(para1: XcmsCCC, para2: PXcmsColor): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsStoreColor*(para1: PDisplay, para2: Colormap, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsStoreColors*(para1: PDisplay, para2: Colormap, para3: PXcmsColor,
                      para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsTekHVCClipC*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                      para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsTekHVCClipV*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                      para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsTekHVCClipVC*(para1: XcmsCCC, para2: PXcmsColor, para3: int32,
                       para4: int32, para5: PBool): Status{.cdecl,
    dynlib: libX11, importc.}
proc XcmsTekHVCQueryMaxC*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsTekHVCQueryMaxV*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsTekHVCQueryMaxVC*(para1: XcmsCCC, para2: XcmsFloat, para3: PXcmsColor): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsTekHVCQueryMaxVSamples*(para1: XcmsCCC, para2: XcmsFloat,
                                 para3: PXcmsColor, para4: int32): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsTekHVCQueryMinV*(para1: XcmsCCC, para2: XcmsFloat, para3: XcmsFloat,
                          para4: PXcmsColor): Status{.cdecl, dynlib: libX11,
    importc.}
proc XcmsTekHVCToCIEuvY*(para1: XcmsCCC, para2: PXcmsColor, para3: PXcmsColor,
                         para4: int32): Status{.cdecl, dynlib: libX11, importc.}
proc XcmsTekHVCWhiteShiftColors*(para1: XcmsCCC, para2: PXcmsColor,
                                 para3: PXcmsColor, para4: XcmsColorFormat,
                                 para5: PXcmsColor, para6: int32, para7: PBool): Status{.
    cdecl, dynlib: libX11, importc.}
proc XcmsVisualOfCCC*(para1: XcmsCCC): PVisual{.cdecl, dynlib: libX11, importc.}
# implementation

proc XcmsUndefinedFormat(): XcmsColorFormat =
  result = 0x00000000'i32

proc XcmsCIEXYZFormat(): XcmsColorFormat =
  result = 0x00000001'i32

proc XcmsCIEuvYFormat(): XcmsColorFormat =
  result = 0x00000002'i32

proc XcmsCIExyYFormat(): XcmsColorFormat =
  result = 0x00000003'i32

proc XcmsCIELabFormat(): XcmsColorFormat =
  result = 0x00000004'i32

proc XcmsCIELuvFormat(): XcmsColorFormat =
  result = 0x00000005'i32

proc XcmsTekHVCFormat(): XcmsColorFormat =
  result = 0x00000006'i32

proc XcmsRGBFormat(): XcmsColorFormat =
  result = 0x80000000'i32

proc XcmsRGBiFormat(): XcmsColorFormat =
  result = 0x80000001'i32

#when defined(MACROS):
proc DisplayOfCCC(ccc: XcmsCCC): PDisplay =
  result = ccc.dpy

proc ScreenNumberOfCCC(ccc: XcmsCCC): int32 =
  result = ccc.screenNumber

proc VisualOfCCC(ccc: XcmsCCC): PVisual =
  result = ccc.visual

proc ClientWhitePointOfCCC(ccc: var XcmsCCC): ptr XcmsColor =
  result = addr(ccc.clientWhitePt)

proc ScreenWhitePointOfCCC(ccc: var XcmsCCC): ptr XcmsColor =
  result = addr(ccc.pPerScrnInfo.screenWhitePt)

proc FunctionSetOfCCC(ccc: XcmsCCC): Xpointer =
  result = ccc.pPerScrnInfo.functionSet

