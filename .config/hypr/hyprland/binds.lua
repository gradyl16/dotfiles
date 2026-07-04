-- ================
-- === Keybinds ===
-- ================

local main_mod = "SUPER"

local term = "kitty"
local file_manager = "nemo"
local browser = "firefox"
local menu = "fuzzel"

-- hl.bind(main_mod .. " + K", hl.dsp.exit())
hl.bind(main_mod .. " + T", hl.dsp.exec_cmd(term))
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("cliphist list | " .. menu .. " --dmenu | cliphist decode | wl-copy,"))
hl.bind(main_mod .. " + N", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(main_mod .. " + S", hl.dsp.group.toggle())

hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind("ALT + CTRL + SHIFT + h", hl.dsp.group.move_window({ forward = true }))
hl.bind("ALT + CTRL + SHIFT + l", hl.dsp.group.move_window({ forward = true }))
hl.bind("ALT + CTRL + SHIFT + k", hl.dsp.group.move_window({ forward = true }))
hl.bind("ALT + CTRL + SHIFT + j", hl.dsp.group.move_window({ forward = true }))

-- Switch windows in group
hl.bind("ALT + SHIFT + h", hl.dsp.group.prev())
hl.bind("ALT + SHIFT + l", hl.dsp.group.next())

-- Change tiling arrangement
hl.bind(main_mod .. " + SHIFT + h", hl.dsp.window.move({ into_or_create_group = "l" }))
hl.bind(main_mod .. " + SHIFT + l", hl.dsp.window.move({ into_or_create_group = "r" }))
hl.bind(main_mod .. " + SHIFT + k", hl.dsp.window.move({ into_or_create_group = "u" }))
hl.bind(main_mod .. " + SHIFT + j", hl.dsp.window.move({ into_or_create_group = "d" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(main_mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(main_mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(main_mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(main_mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(main_mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(main_mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(main_mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(main_mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(main_mod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(main_mod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(main_mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(main_mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(main_mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(main_mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(main_mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(main_mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(main_mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(main_mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(main_mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(main_mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)
hl.bind(main_mod .. " + G", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize())

-- Audio mgmt
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
