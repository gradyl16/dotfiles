-- =================
-- === Variables ===
-- =================
--
-- See https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		border_size = 2,
	},
	group = {
		merge_groups_on_drag = false,
		groupbar = {
			indicator_height = 5,
			render_titles = false,
			keep_upper_gap = false,

			rounding = 2,
			rounding_power = 4,
			round_only_edges = false,
		},
	},
	decoration = {
		rounding = 2,
		rounding_power = 4,

		dim_inactive = true,
		dim_strength = 0.15,
		dim_special = 0.15,

		blur = {
			size = 3,
		},
	},
	dwindle = {
		preserve_split = true,
	},
	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 2,

		font_family = "FiraCode Nerd Font",
		splash_font_family = "FiraCode Nerd Font",

		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
	},
})
