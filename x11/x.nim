
#
#  Automatically converted by H2Pas 0.99.15 from x.h
#  The following command line parameters were used:
#    -p
#    -T
#    -S
#    -d
#    -c
#    x.h
#
# Pointers to basic pascal types, inserted by h2pas conversion program.

const
  X_PROTOCOL* = 11
  X_PROTOCOL_REVISION* = 0

type
  PXID* = ptr XID
  XID* = culong

  PMask* = ptr Mask
  Mask* = culong

  PPAtom* = ptr PAtom
  PAtom* = ptr Atom
  Atom* = culong

  PVisualID* = ptr VisualID
  VisualID* = culong

  PTime* = ptr Time
  Time* = culong

  PPWindow* = ptr PWindow
  PWindow* = ptr Window
  Window* = XID

  PDrawable* = ptr Drawable
  Drawable* = XID

  PFont* = ptr Font
  Font* = XID

  PPixmap* = ptr Pixmap
  Pixmap* = XID

  PCursor* = ptr Cursor
  Cursor* = XID

  PColormap* = ptr Colormap
  Colormap* = XID

  PGContext* = ptr GContext
  GContext* = XID

  PKeySym* = ptr KeySym
  KeySym* = XID

  PKeyCode* = ptr KeyCode
  KeyCode* = cuchar

{.deprecated: [TXID: XID].}
{.deprecated: [TMask: Mask].}
{.deprecated: [TAtom: Atom].}
{.deprecated: [TVisualID: VisualID].}
{.deprecated: [TTime: Time].}
{.deprecated: [TWindow: Window].}
{.deprecated: [TDrawable: Drawable].}
{.deprecated: [TFont: Font].}
{.deprecated: [TPixmap: Pixmap].}
{.deprecated: [TCursor: Cursor].}
{.deprecated: [TColormap: Colormap].}
{.deprecated: [TGContext: GContext].}
{.deprecated: [TKeySym: KeySym].}
{.deprecated: [TKeyCode: KeyCode].}

const
  None* = 0
  ParentRelative* = 1
  CopyFromParent* = 0
  PointerWindow* = 0
  InputFocus* = 1
  PointerRoot* = 1
  AnyPropertyType* = 0
  AnyKey* = 0
  AnyButton* = 0
  AllTemporary* = 0
  CurrentTime* = 0
  NoSymbol* = 0
  NoEventMask* = 0
  KeyPressMask* = 1 shl 0
  KeyReleaseMask* = 1 shl 1
  ButtonPressMask* = 1 shl 2
  ButtonReleaseMask* = 1 shl 3
  EnterWindowMask* = 1 shl 4
  LeaveWindowMask* = 1 shl 5
  PointerMotionMask* = 1 shl 6
  PointerMotionHintMask* = 1 shl 7
  Button1MotionMask* = 1 shl 8
  Button2MotionMask* = 1 shl 9
  Button3MotionMask* = 1 shl 10
  Button4MotionMask* = 1 shl 11
  Button5MotionMask* = 1 shl 12
  ButtonMotionMask* = 1 shl 13
  KeymapStateMask* = 1 shl 14
  ExposureMask* = 1 shl 15
  VisibilityChangeMask* = 1 shl 16
  StructureNotifyMask* = 1 shl 17
  ResizeRedirectMask* = 1 shl 18
  SubstructureNotifyMask* = 1 shl 19
  SubstructureRedirectMask* = 1 shl 20
  FocusChangeMask* = 1 shl 21
  PropertyChangeMask* = 1 shl 22
  ColormapChangeMask* = 1 shl 23
  OwnerGrabButtonMask* = 1 shl 24
  KeyPress* = 2
  KeyRelease* = 3
  ButtonPress* = 4
  ButtonRelease* = 5
  MotionNotify* = 6
  EnterNotify* = 7
  LeaveNotify* = 8
  FocusIn* = 9
  FocusOut* = 10
  KeymapNotify* = 11
  Expose* = 12
  GraphicsExpose* = 13
  NoExpose* = 14
  VisibilityNotify* = 15
  CreateNotify* = 16
  DestroyNotify* = 17
  UnmapNotify* = 18
  MapNotify* = 19
  MapRequest* = 20
  ReparentNotify* = 21
  ConfigureNotify* = 22
  ConfigureRequest* = 23
  GravityNotify* = 24
  ResizeRequest* = 25
  CirculateNotify* = 26
  CirculateRequest* = 27
  PropertyNotify* = 28
  SelectionClear* = 29
  SelectionRequest* = 30
  SelectionNotify* = 31
  ColormapNotify* = 32
  ClientMessage* = 33
  MappingNotify* = 34
  LASTEvent* = 35
  ShiftMask* = 1 shl 0
  LockMask* = 1 shl 1
  ControlMask* = 1 shl 2
  Mod1Mask* = 1 shl 3
  Mod2Mask* = 1 shl 4
  Mod3Mask* = 1 shl 5
  Mod4Mask* = 1 shl 6
  Mod5Mask* = 1 shl 7
  ShiftMapIndex* = 0
  LockMapIndex* = 1
  ControlMapIndex* = 2
  Mod1MapIndex* = 3
  Mod2MapIndex* = 4
  Mod3MapIndex* = 5
  Mod4MapIndex* = 6
  Mod5MapIndex* = 7
  Button1Mask* = 1 shl 8
  Button2Mask* = 1 shl 9
  Button3Mask* = 1 shl 10
  Button4Mask* = 1 shl 11
  Button5Mask* = 1 shl 12
  AnyModifier* = 1 shl 15
  Button1* = 1
  Button2* = 2
  Button3* = 3
  Button4* = 4
  Button5* = 5
  NotifyNormal* = 0
  NotifyGrab* = 1
  NotifyUngrab* = 2
  NotifyWhileGrabbed* = 3
  NotifyHint* = 1
  NotifyAncestor* = 0
  NotifyVirtual* = 1
  NotifyInferior* = 2
  NotifyNonlinear* = 3
  NotifyNonlinearVirtual* = 4
  NotifyPointer* = 5
  NotifyPointerRoot* = 6
  NotifyDetailNone* = 7
  VisibilityUnobscured* = 0
  VisibilityPartiallyObscured* = 1
  VisibilityFullyObscured* = 2
  PlaceOnTop* = 0
  PlaceOnBottom* = 1
  FamilyInternet* = 0
  FamilyDECnet* = 1
  FamilyChaos* = 2
  FamilyInternet6* = 6
  FamilyServerInterpreted* = 5
  PropertyNewValue* = 0
  PropertyDelete* = 1
  ColormapUninstalled* = 0
  ColormapInstalled* = 1
  GrabModeSync* = 0
  GrabModeAsync* = 1
  GrabSuccess* = 0
  AlreadyGrabbed* = 1
  GrabInvalidTime* = 2
  GrabNotViewable* = 3
  GrabFrozen* = 4
  AsyncPointer* = 0
  SyncPointer* = 1
  ReplayPointer* = 2
  AsyncKeyboard* = 3
  SyncKeyboard* = 4
  ReplayKeyboard* = 5
  AsyncBoth* = 6
  SyncBoth* = 7
  RevertToNone* = None
  RevertToPointerRoot* = PointerRoot
  RevertToParent* = 2
  Success* = 0
  BadRequest* = 1
  BadValue* = 2
  BadWindow* = 3
  BadPixmap* = 4
  BadAtom* = 5
  BadCursor* = 6
  BadFont* = 7
  BadMatch* = 8
  BadDrawable* = 9
  BadAccess* = 10
  BadAlloc* = 11
  BadColor* = 12
  BadGC* = 13
  BadIDChoice* = 14
  BadName* = 15
  BadLength* = 16
  BadImplementation* = 17
  FirstExtensionError* = 128
  LastExtensionError* = 255
  InputOutput* = 1
  InputOnly* = 2
  CWBackPixmap* = 1 shl 0
  CWBackPixel* = 1 shl 1
  CWBorderPixmap* = 1 shl 2
  CWBorderPixel* = 1 shl 3
  CWBitGravity* = 1 shl 4
  CWWinGravity* = 1 shl 5
  CWBackingStore* = 1 shl 6
  CWBackingPlanes* = 1 shl 7
  CWBackingPixel* = 1 shl 8
  CWOverrideRedirect* = 1 shl 9
  CWSaveUnder* = 1 shl 10
  CWEventMask* = 1 shl 11
  CWDontPropagate* = 1 shl 12
  CWColormap* = 1 shl 13
  CWCursor* = 1 shl 14
  CWX* = 1 shl 0
  CWY* = 1 shl 1
  CWWidth* = 1 shl 2
  CWHeight* = 1 shl 3
  CWBorderWidth* = 1 shl 4
  CWSibling* = 1 shl 5
  CWStackMode* = 1 shl 6
  ForgetGravity* = 0
  NorthWestGravity* = 1
  NorthGravity* = 2
  NorthEastGravity* = 3
  WestGravity* = 4
  CenterGravity* = 5
  EastGravity* = 6
  SouthWestGravity* = 7
  SouthGravity* = 8
  SouthEastGravity* = 9
  StaticGravity* = 10
  UnmapGravity* = 0
  NotUseful* = 0
  WhenMapped* = 1
  Always* = 2
  IsUnmapped* = 0
  IsUnviewable* = 1
  IsViewable* = 2
  SetModeInsert* = 0
  SetModeDelete* = 1
  DestroyAll* = 0
  RetainPermanent* = 1
  RetainTemporary* = 2
  Above* = 0
  Below* = 1
  TopIf* = 2
  BottomIf* = 3
  Opposite* = 4
  RaiseLowest* = 0
  LowerHighest* = 1
  PropModeReplace* = 0
  PropModePrepend* = 1
  PropModeAppend* = 2
  GXclear* = 0x00000000
  GXand* = 0x00000001
  GXandReverse* = 0x00000002
  GXcopy* = 0x00000003
  GXandInverted* = 0x00000004
  GXnoop* = 0x00000005
  GXxor* = 0x00000006
  GXor* = 0x00000007
  GXnor* = 0x00000008
  GXequiv* = 0x00000009
  GXinvert* = 0x0000000A
  GXorReverse* = 0x0000000B
  GXcopyInverted* = 0x0000000C
  GXorInverted* = 0x0000000D
  GXnand* = 0x0000000E
  GXset* = 0x0000000F
  LineSolid* = 0
  LineOnOffDash* = 1
  LineDoubleDash* = 2
  CapNotLast* = 0
  CapButt* = 1
  CapRound* = 2
  CapProjecting* = 3
  JoinMiter* = 0
  JoinRound* = 1
  JoinBevel* = 2
  FillSolid* = 0
  FillTiled* = 1
  FillStippled* = 2
  FillOpaqueStippled* = 3
  EvenOddRule* = 0
  WindingRule* = 1
  ClipByChildren* = 0
  IncludeInferiors* = 1
  Unsorted* = 0
  YSorted* = 1
  YXSorted* = 2
  YXBanded* = 3
  CoordModeOrigin* = 0
  CoordModePrevious* = 1
  Complex* = 0
  Nonconvex* = 1
  Convex* = 2
  ArcChord* = 0
  ArcPieSlice* = 1
  GCFunction* = 1 shl 0
  GCPlaneMask* = 1 shl 1
  GCForeground* = 1 shl 2
  GCBackground* = 1 shl 3
  GCLineWidth* = 1 shl 4
  GCLineStyle* = 1 shl 5
  GCCapStyle* = 1 shl 6
  GCJoinStyle* = 1 shl 7
  GCFillStyle* = 1 shl 8
  GCFillRule* = 1 shl 9
  GCTile* = 1 shl 10
  GCStipple* = 1 shl 11
  GCTileStipXOrigin* = 1 shl 12
  GCTileStipYOrigin* = 1 shl 13
  GCFont* = 1 shl 14
  GCSubwindowMode* = 1 shl 15
  GCGraphicsExposures* = 1 shl 16
  GCClipXOrigin* = 1 shl 17
  GCClipYOrigin* = 1 shl 18
  GCClipMask* = 1 shl 19
  GCDashOffset* = 1 shl 20
  GCDashList* = 1 shl 21
  GCArcMode* = 1 shl 22
  GCLastBit* = 22
  FontLeftToRight* = 0
  FontRightToLeft* = 1
  FontChange* = 255
  XYBitmap* = 0
  XYPixmap* = 1
  ZPixmap* = 2
  AllocNone* = 0
  AllocAll* = 1
  DoRed* = 1 shl 0
  DoGreen* = 1 shl 1
  DoBlue* = 1 shl 2
  CursorShape* = 0
  TileShape* = 1
  StippleShape* = 2
  AutoRepeatModeOff* = 0
  AutoRepeatModeOn* = 1
  AutoRepeatModeDefault* = 2
  LedModeOff* = 0
  LedModeOn* = 1
  KBKeyClickPercent* = 1 shl 0
  KBBellPercent* = 1 shl 1
  KBBellPitch* = 1 shl 2
  KBBellDuration* = 1 shl 3
  KBLed* = 1 shl 4
  KBLedMode* = 1 shl 5
  KBKey* = 1 shl 6
  KBAutoRepeatMode* = 1 shl 7
  MappingSuccess* = 0
  MappingBusy* = 1
  MappingFailed* = 2
  MappingModifier* = 0
  MappingKeyboard* = 1
  MappingPointer* = 2
  DontPreferBlanking* = 0
  PreferBlanking* = 1
  DefaultBlanking* = 2
  DisableScreenSaver* = 0
  DisableScreenInterval* = 0
  DontAllowExposures* = 0
  AllowExposures* = 1
  DefaultExposures* = 2
  ScreenSaverReset* = 0
  ScreenSaverActive* = 1
  HostInsert* = 0
  HostDelete* = 1
  EnableAccess* = 1
  DisableAccess* = 0
  StaticGray* = 0
  GrayScale* = 1
  StaticColor* = 2
  PseudoColor* = 3
  TrueColor* = 4
  DirectColor* = 5
  LSBFirst* = 0
  MSBFirst* = 1

# implementation
