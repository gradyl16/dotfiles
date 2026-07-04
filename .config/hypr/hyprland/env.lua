-- =============================
-- === Environment Variables ===
-- =============================
--
-- # See https://wiki.hypr.land/Configuring/Environment-variables/

-- For debugging only
-- hl.env("HYPRLAND_TRACE", "1")

-- Themes
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM","wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME","qt5ct")

-- Desktop compatibility
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XDG_CURRENT_DESKTOP","Hyprland")
hl.env("XDG_SESSION_DESKTOP","Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
