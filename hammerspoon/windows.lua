-- Animation duration, in seconds
hs.window.animationDuration = 0

-- No margins between windows.
hs.grid.setMargins('0, 0')

-- Size focused window to left half of display
hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = (max.w / 2) - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Move window to take half of right side
hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2) + 10
  f.y = max.y + 10
  f.w = (max.w / 2) - 20
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to left third of display
hs.hotkey.bind({"cmd", "ctrl"}, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = (max.w / 3) - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to left two-thirds of display
hs.hotkey.bind({"cmd", "ctrl"}, "j", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = ((max.w / 3) * 2) - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to middle third of display
hs.hotkey.bind({"cmd", "ctrl"}, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = (max.x + (max.w / 3)) + 10
  f.y = max.y + 10
  f.w = (max.w / 3) - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to the center of the screen
hs.hotkey.bind({"cmd", "ctrl"}, "u", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = (max.x + (max.w / 3))
  f.y = (max.y + (max.h / 6))
  f.w = (max.w / 3) - 50
  f.h = (max.h / 2) + 20
  win:setFrame(f)
end)

-- Size focused window to center two-thirds of display
hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = (max.w / 6)
  f.y = max.y + 10
  f.w = ((max.w / 3) * 2) - 10
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to right third of display
hs.hotkey.bind({"cmd", "ctrl"}, ";", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = (max.x + (max.w / 3 * 2)) + 10
  f.y = max.y + 10
  f.w = (max.w / 3) - 20
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to Size of desktop
hs.hotkey.bind({"cmd", "ctrl"}, "return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = max.w - 20
  f.h = max.h - 20
  win:setFrame(f)
end)

-- Size focused window to top half of display
hs.hotkey.bind({"cmd", "ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + 10
  f.w = max.w - 20
  f.h = (max.h / 2) - 20
  win:setFrame(f)
end)

-- Size focused window to bottom half of display
hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 10
  f.y = max.y + (max.h / 2)
  f.w = max.w - 20
  f.h = (max.h / 2) - 10
  win:setFrame(f)
end)
