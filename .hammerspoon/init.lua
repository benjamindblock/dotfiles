hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- Toggle macOS Light/Dark mode. Ghostty picks bdb_torte_light or
-- bdb_torte_dark from the system appearance, and every running Neovim
-- follows Ghostty, so this one key flips the whole terminal setup (and any
-- other app that follows the system appearance).
--
-- The first press makes macOS ask whether Hammerspoon may control
-- "System Events"; allow it once.
hs.hotkey.bind({"cmd", "ctrl"}, "t", function()
  hs.osascript.applescript([[
    tell application "System Events" to tell appearance preferences
      set dark mode to not dark mode
    end tell
  ]])
end)

require("windows")
