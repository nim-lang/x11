import 
  x11/xlib,
  x11/xutil,
  x11/x,
  x11/xft,
  x11/xrender

const
  WINDOW_WIDTH = 400
  WINDOW_HEIGHT = 300

var
  width, height: cuint
  display: PDisplay
  screen: cint
  depth: int
  win: Window
  sizeHints: XSizeHints
  wmDeleteMessage: Atom
  running: bool
  xev: XEvent
  displayString = "Hello, Nimrods."
  fontName = "monospace:size=10"
  font: PXftFont
  xftDraw: PXftDraw
  xftColor: XftColor

proc create_window = 
  width = WINDOW_WIDTH
  height = WINDOW_HEIGHT

  display = XOpenDisplay(nil)
  if display == nil:
    quit "Failed to open display"

  screen = XDefaultScreen(display)

  font = XftFontOpenXlfd(display, screen, fontName)
  if font == nil:
    font = XftFontOpenName(display, screen, fontName)
    if font == nil:
      quit "Failed to load a valid font"

  depth = XDefaultDepth(display, screen)
  var rootwin = XRootWindow(display, screen)
  win = XCreateSimpleWindow(display, rootwin, 100, 10,
                            width, height, 5,
                            XBlackPixel(display, screen),
                            XWhitePixel(display, screen))
  sizeHints.flags = PSize or PMinSize or PMaxSize
  sizeHints.min_width =  width.cint
  sizeHints.max_width =  width.cint
  sizeHints.min_height = height.cint
  sizeHints.max_height = height.cint
  discard XSetStandardProperties(display, win, "Simple Window", "window",
                         0, nil, 0, addr(sizeHints))
  discard XSelectInput(display, win, ButtonPressMask or KeyPressMask or 
                                     PointerMotionMask or ExposureMask)
  discard XMapWindow(display, win)

  wmDeleteMessage = XInternAtom(display, "WM_DELETE_WINDOW", false.XBool)
  discard XSetWMProtocols(display, win, wmDeleteMessage.addr, 1)

  xftDraw = XftDrawCreate(display, win, DefaultVisual(display, 0), DefaultColormap(display, 0))
  var xrenderColor: XRenderColor
  xrenderColor.red = 65535
  xrenderColor.green = 0
  xrenderColor.blue = 0
  xrenderColor.alpha = 65535
  discard XftColorAllocValue(
    display,
    DefaultVisual(display, 0),
    DefaultColormap(display, 0),
    xrenderColor.addr,
    xftColor.addr
  )

  running = true

proc close_window =
  discard XDestroyWindow(display, win)
  discard XCloseDisplay(display)

proc draw_screen =
  # TODO: This is rendering strange characters, but the first letter is always correct.
  XftDrawStringUtf8(xftDraw, xftColor.addr, font, 20, 70, cast[PFcChar8](displayString.addr), displayString.len.cint)

proc handle_event =
  discard XNextEvent(display, xev.addr)
  case xev.theType
  of Expose:
    draw_screen()
  of ClientMessage:
    if cast[Atom](xev.xclient.data.l[0]) == wmDeleteMessage:
      running = false
  of KeyPress:
    var key = XLookupKeysym(cast[PXKeyEvent](xev.addr), 0)
    if key != 0:
      echo "Keyboard event"
  of ButtonPressMask, PointerMotionMask:
    echo "Mouse event"
  else:
    discard

create_window()
while running:
  handle_event()
close_window()

