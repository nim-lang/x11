
import
  x, xlib

#const
#  libX11* = "libX11.so"

#
#  Automatically converted by H2Pas 0.99.15 from xresource.h
#  The following command line parameters were used:
#    -p
#    -T
#    -S
#    -d
#    -c
#    xresource.h
#

proc Xpermalloc*(para1: int32): cstring{.cdecl, dynlib: libX11, importc.}

type
  PXrmQuark* = ptr XrmQuark
  XrmQuark* = int32

  XrmQuarkList* = PXrmQuark
  PXrmQuarkList* = ptr XrmQuarkList

{.deprecated: [TXrmQuark: XrmQuark].}
{.deprecated: [TXrmQuarkList: XrmQuarkList].}

proc NULLQUARK*(): XrmQuark

type
  PXrmString* = ptr XrmString
  XrmString* = ptr char

{.deprecated: [TXrmString: XrmString].}

proc NULLSTRING*(): XrmString
proc XrmStringToQuark*(para1: cstring): XrmQuark{.cdecl, dynlib: libX11,
    importc.}
proc XrmPermStringToQuark*(para1: cstring): XrmQuark{.cdecl, dynlib: libX11,
    importc.}
proc XrmQuarkToString*(para1: XrmQuark): XrmString{.cdecl, dynlib: libX11,
    importc.}
proc XrmUniqueQuark*(): XrmQuark{.cdecl, dynlib: libX11, importc.}
#when defined(MACROS):
proc XrmStringsEqual*(a1, a2: cstring): bool

type
  PXrmBinding* = ptr XrmBinding
  XrmBinding* = enum
    XrmBindTightly, XrmBindLoosely

  XrmBindingList* = PXrmBinding
  PXrmBindingList* = ptr XrmBindingList

{.deprecated: [TXrmBinding: XrmBinding].}
{.deprecated: [TXrmBindingList: XrmBindingList].}

proc XrmStringToQuarkList*(para1: cstring, para2: XrmQuarkList){.cdecl,
    dynlib: libX11, importc.}
proc XrmStringToBindingQuarkList*(para1: cstring, para2: XrmBindingList,
                                  para3: XrmQuarkList){.cdecl, dynlib: libX11,
    importc.}

type
  PXrmName* = ptr XrmName
  XrmName* = XrmQuark

  PXrmNameList* = ptr XrmNameList
  XrmNameList* = XrmQuarkList

{.deprecated: [TXrmName: XrmName].}
{.deprecated: [TXrmNameList: XrmNameList].}

#when defined(MACROS):
proc XrmNameToString*(name: int32): XrmString
proc XrmStringToName*(str: cstring): int32
proc XrmStringToNameList*(str: cstring, name: PXrmQuark)

type
  PXrmClass* = ptr XrmClass
  XrmClass* = XrmQuark

  PXrmClassList* = ptr XrmClassList
  XrmClassList* = XrmQuarkList

{.deprecated: [TXrmClass: XrmClass].}
{.deprecated: [TXrmClassList: XrmClassList].}

#when defined(MACROS):
proc XrmClassToString*(c_class: int32): XrmString
proc XrmStringToClass*(c_class: cstring): int32
proc XrmStringToClassList*(str: cstring, c_class: PXrmQuark)

type
  PXrmRepresentation* = ptr XrmRepresentation
  XrmRepresentation* = XrmQuark
{.deprecated: [TXrmRepresentation: XrmRepresentation].}

#when defined(MACROS):
proc XrmStringToRepresentation*(str: cstring): int32
proc XrmRepresentationToString*(thetype: int32): XrmString

type
  PXrmValue* = ptr XrmValue
  XrmValue*{.final.} = object
    size*: int32
    address*: XPointer

  PXrmValuePtr* = ptr XrmValuePtr
  XrmValuePtr* = PXrmValue

  PXrmHashBucketRec* = ptr XrmHashBucketRec
  XrmHashBucketRec*{.final.} = object

  PXrmHashBucket* = ptr XrmHashBucket
  XrmHashBucket* = PXrmHashBucketRec

  PXrmHashTable* = ptr XrmHashTable
  XrmHashTable* = ptr XrmHashBucket

  PXrmDatabase* = ptr XrmDatabase
  XrmDatabase* = PXrmHashBucketRec

{.deprecated: [TXrmValue: XrmValue].}
{.deprecated: [TXrmValuePtr: XrmValuePtr].}
{.deprecated: [TXrmHashBucketRec: XrmHashBucketRec].}
{.deprecated: [TXrmHashBucket: XrmHashBucket].}
{.deprecated: [TXrmHashTable: XrmHashTable].}
{.deprecated: [TXrmDatabase: XrmDatabase].}

proc XrmDestroyDatabase*(para1: XrmDatabase){.cdecl, dynlib: libX11, importc.}
proc XrmQPutResource*(para1: PXrmDatabase, para2: XrmBindingList,
                      para3: XrmQuarkList, para4: XrmRepresentation,
                      para5: PXrmValue){.cdecl, dynlib: libX11, importc.}
proc XrmPutResource*(para1: PXrmDatabase, para2: cstring, para3: cstring,
                     para4: PXrmValue){.cdecl, dynlib: libX11, importc.}
proc XrmQPutStringResource*(para1: PXrmDatabase, para2: XrmBindingList,
                            para3: XrmQuarkList, para4: cstring){.cdecl,
    dynlib: libX11, importc.}
proc XrmPutStringResource*(para1: PXrmDatabase, para2: cstring, para3: cstring){.
    cdecl, dynlib: libX11, importc.}
proc XrmPutLineResource*(para1: PXrmDatabase, para2: cstring){.cdecl,
    dynlib: libX11, importc.}
proc XrmQGetResource*(para1: XrmDatabase, para2: XrmNameList,
                      para3: XrmClassList, para4: PXrmRepresentation,
                      para5: PXrmValue): XBool{.cdecl, dynlib: libX11, importc.}
proc XrmGetResource*(para1: XrmDatabase, para2: cstring, para3: cstring,
                     para4: PPchar, para5: PXrmValue): XBool{.cdecl,
    dynlib: libX11, importc.}
  # There is no definition of XrmSearchList
  #function XrmQGetSearchList(para1:XrmDatabase; para2:XrmNameList; para3:XrmClassList; para4:XrmSearchList; para5:longint):XBool;cdecl;external libX11;
  #function XrmQGetSearchResource(para1:XrmSearchList; para2:XrmName; para3:XrmClass; para4:PXrmRepresentation; para5:PXrmValue):XBool;cdecl;external libX11;
proc XrmSetDatabase*(para1: PDisplay, para2: XrmDatabase){.cdecl,
    dynlib: libX11, importc.}
proc XrmGetDatabase*(para1: PDisplay): XrmDatabase{.cdecl, dynlib: libX11,
    importc.}
proc XrmGetFileDatabase*(para1: cstring): XrmDatabase{.cdecl, dynlib: libX11,
    importc.}
proc XrmCombineFileDatabase*(para1: cstring, para2: PXrmDatabase, para3: XBool): Status{.
    cdecl, dynlib: libX11, importc.}
proc XrmGetStringDatabase*(para1: cstring): XrmDatabase{.cdecl, dynlib: libX11,
    importc.}
proc XrmPutFileDatabase*(para1: XrmDatabase, para2: cstring){.cdecl,
    dynlib: libX11, importc.}
proc XrmMergeDatabases*(para1: XrmDatabase, para2: PXrmDatabase){.cdecl,
    dynlib: libX11, importc.}
proc XrmCombineDatabase*(para1: XrmDatabase, para2: PXrmDatabase, para3: XBool){.
    cdecl, dynlib: libX11, importc.}
const
  XrmEnumAllLevels* = 0
  XrmEnumOneLevel* = 1

type
  funcbool* = proc (): XBool {.cdecl.}

proc XrmEnumerateDatabase*(para1: XrmDatabase, para2: XrmNameList,
                           para3: XrmClassList, para4: int32, para5: funcbool,
                           para6: XPointer): XBool{.cdecl, dynlib: libX11,
    importc.}
proc XrmLocaleOfDatabase*(para1: XrmDatabase): cstring{.cdecl, dynlib: libX11,
    importc.}

type
  PXrmOptionKind* = ptr XrmOptionKind
  XrmOptionKind* = enum
    XrmoptionNoArg, XrmoptionIsArg, XrmoptionStickyArg, XrmoptionSepArg,
    XrmoptionResArg, XrmoptionSkipArg, XrmoptionSkipLine, XrmoptionSkipNArgs

  PXrmOptionDescRec* = ptr XrmOptionDescRec
  XrmOptionDescRec*{.final.} = object
    option*: cstring
    specifier*: cstring
    argKind*: XrmOptionKind
    value*: XPointer

  XrmOptionDescList* = PXrmOptionDescRec
  PXrmOptionDescList* = ptr XrmOptionDescList

{.deprecated: [TXrmOptionKind: XrmOptionKind].}
{.deprecated: [TXrmOptionDescRec: XrmOptionDescRec].}
{.deprecated: [TPXrmOptionDescList: PXrmOptionDescList].}

proc XrmParseCommand*(para1: PXrmDatabase, para2: XrmOptionDescList,
                      para3: int32, para4: cstring, para5: ptr int32,
                      para6: PPchar){.cdecl, dynlib: libX11, importc.}
# implementation

proc NULLQUARK(): XrmQuark =
  result = XrmQuark(0)

proc NULLSTRING(): XrmString =
  result = nil

#when defined(MACROS):
proc XrmStringsEqual(a1, a2: cstring): bool =
  #result = (strcomp(a1, a2)) == 0
  $a1 == $a2

proc XrmNameToString(name: int32): XrmString =
  result = XrmQuarkToString(name)

proc XrmStringToName(str: cstring): int32 =
  result = XrmStringToQuark(str)

proc XrmStringToNameList(str: cstring, name: PXrmQuark) =
  XrmStringToQuarkList(str, name)

proc XrmClassToString(c_class: int32): XrmString =
  result = XrmQuarkToString(c_class)

proc XrmStringToClass(c_class: cstring): int32 =
  result = XrmStringToQuark(c_class)

proc XrmStringToClassList(str: cstring, c_class: PXrmQuark) =
  XrmStringToQuarkList(str, c_class)

proc XrmStringToRepresentation(str: cstring): int32 =
  result = XrmStringToQuark(str)

proc XrmRepresentationToString(thetype: int32): XrmString =
  result = XrmQuarkToString(thetype)
