-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Monitor binding
hl.workspace_rule({
	workspace = "2",
	monitor = "DP-1",
	default = true,
})

hl.workspace_rule({
	workspace = "4",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "6",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "1",
	monitor = "HDMI-A-1",
	default = true,
})

hl.workspace_rule({
	workspace = "3",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "5",
	monitor = "HDMI-A-1",
})

-- Fullscreening
hl.workspace_rule({
	workspace = "w[tv1]",
	gaps_out = 0,
	gaps_in = 0,
})
