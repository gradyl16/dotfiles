-- =================
-- === Autostart ===
-- =================

hl.on("hyprland.start", function ()
  -- Startup apps
  hl.exec_cmd("hyprpanel & hyprpaper & firefox & kitty & spotify & slack & signal-desktop & hypridle")

  -- Clipboard
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
