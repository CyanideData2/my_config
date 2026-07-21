-- -----------------------------------------------------
-- General window layout and colors
-- name: "Window"
-- -----------------------------------------------------
local cols = require("lua.colors")
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = cols.primary,
		},
		layout = "dwindle",
		resize_on_border = true,
		no_focus_fallback = true,
	},

	animations = {
		enabled = false,
	},

	decoration = {
		rounding = 2,
		blur = { enabled = false },
		shadow = { enabled = false },
	},
})
hl.window_rule({
	name = "float",
	match = {
		title = "bitwarden",
	},
	float = true,
})

-- windowrule = match:class floating, float on
-- windowrule = match:class org.pulseaudio.pavucontrol, float on
-- windowrule = match:class prompt, float on
-- windowrule = match:class prompt, size 500 80
-- windowrule = match:fullscreen 1, border_color $secondary
--
-- layerrule {
--   name = noctalia
--   match:namespace = noctalia-background-.*$
--   ignore_alpha = 0.5
--   blur = true
--   blur_popups = true
-- }
-- layerrule = match:namespace noctalia-shell:regionSelector, no_anim on
