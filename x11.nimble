version = "1.2"
author ="Andreas Rumpf"
description = "Wrapper for X11"
license = "MIT"

requires "nim > 0.9.2"

task test, "test":
  exec "nim c examples/x11ex.nim"
  exec "nim c examples/xshmex.nim"
  exec "nim c examples/xftex.nim"
