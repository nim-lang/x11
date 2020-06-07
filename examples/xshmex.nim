# Example for MIT-SHM X11 extension
# References:
#   https://www.x.org/releases/X11R7.7/doc/xextproto/shm.html
#   http://netpbm.sourceforge.net/doc/ppm.html
#   https://github.com/def-/nim-syscall

import
  x11/xlib,
  x11/xutil,
  x11/xshm,
  x11/x

when defined(amd64):
  type Number = enum
    SHMGET = 29
    SHMAT = 30
    SHMCTL = 31
    SHMDT = 67

  proc syscall*(n: Number, a1: any): clong {.inline.} =
    {.emit: """asm volatile(
      "syscall" : "=a"(`result`)
                : "a"((long)`n`), "D"((long)`a1`)
                : "memory", "r11", "rcx", "cc");""".}

  proc syscall*(n: Number, a1, a2, a3: any): clong {.inline.} =
    {.emit: """asm volatile(
      "syscall" : "=a"(`result`)
                : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`),
                   "d"((long)`a3`)
                : "memory", "r11", "rcx", "cc");""".}
else:
  {.error: "This example only supports Linux x86_64. Feel free to submit a PR to https://github.com/nim-lang/x11 to extend it.".}

const
  IPC_PRIVATE = 0
  IPC_CREAT = 512
  IPC_RMID = 0

proc saveToPPM*(image: PXImage, filePath: string) =
  var f = open(filePath, fmWrite)
  defer: f.close
  writeLine(f, "P6")
  writeLine(f, image.width, " ", image.height)
  writeLine(f, 255)
  for i in 0..<(image.width * image.height):
    f.write(image.data[i * 4 + 2])
    f.write(image.data[i * 4 + 1])
    f.write(image.data[i * 4 + 0])

when isMainModule:
  let display = XOpenDisplay(nil)
  if display == nil:
    quit("Could not open the display")

  block:
    var major, minor: cint
    var pixmaps: XBool
    discard XShmQueryVersion(display, addr major, addr minor, addr pixmaps)
    echo "MIT-SHM Version ", major, ".", minor, ", Pixmaps supported: ", pixmaps

  var attributes: XWindowAttributes
  discard XGetWindowAttributes(
    display,
    DefaultRootWindow(display),
    addr attributes)

  var shminfo: XShmSegmentInfo
  let screen = DefaultScreen(display)
  var image = XShmCreateImage(
    display,
    DefaultVisual(display, screen),
    DefaultDepthOfScreen(ScreenOfDisplay(display, screen)).cuint,
    ZPixmap,
    nil,
    addr shminfo,
    attributes.width.cuint,
    attributes.height.cuint)

  shminfo.shmid = syscall(SHMGET,
                          IPC_PRIVATE,
                          image.bytes_per_line * image.height,
                          IPC_CREAT or 0o777).cint

  shminfo.shmaddr = cast[cstring](syscall(SHMAT, shminfo.shmid, 0, 0))
  image.data = shminfo.shmaddr
  shminfo.readOnly = 0

  discard XShmAttach(display, addr shminfo)

  discard XShmGetImage(display, DefaultRootWindow(display), image, 0.cint, 0.cint, AllPlanes);
  discard XSync(display, 0);

  echo "Taking a screenshot using MIT-SHM extension..."
  image.saveToPPM("./screenshot.ppm")
  echo "DONE! Screenshot is saved in ./screenshot.ppm"

  discard XShmDetach(display, addr shminfo)
  discard XDestroyImage(image)
  discard syscall(SHMDT, shminfo.shmaddr)
  discard syscall(SHMCTL, shminfo.shmid, IPC_RMID, 0)
  discard display.XCloseDisplay
