hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

require("windows")
