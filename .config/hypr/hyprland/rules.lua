-- ====================
-- === WINDOW RULES ===
-- ====================

hl.window_rule({
	name = "term-layout",
	match = {
		class = "kitty",
	},
	workspace = "2",
})

hl.window_rule({
	name = "firefox-layout",
	match = {
		class = "firefox",
	},
	workspace = "3",
	no_initial_focus = true,
})

hl.window_rule({
	name = "signal-layout",
	match = {
		class = "signal",
	},
	workspace = "1",
	group = "set",
	no_initial_focus = false,
})

hl.window_rule({
	name = "slack-layout",
	match = {
		class = "slack",
	},
	workspace = "1",
    group = "invade",
	no_initial_focus = true,
})

hl.window_rule({
	name = "spotify-layout",
	match = {
		class = "spotify",
	},
	workspace = "1",
	group = "barred",
	no_initial_focus = true,
})

-- Desktop app fixes
hl.window_rule({
	name = "zoom-menu-stabilize",
	match = {
		class = "zoom",
		title = "menu window",
	},
	stay_focused = true,
})

hl.window_rule({
	name = "zoom-toolbar-stabilize",
	match = {
		class = "zoom",
		title = "Toolbar Menu",
	},
	stay_focused = true,
})
