-- -----------------------------------------------------
-- Desktop Environment Options
-- https://wiki.hyprland.org/Configuring/Variables/#input
-- -----------------------------------------------------
--
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1.2,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@120",
	position = "0x-1080",
	scale = 1,
})
-- exec-once = /home/julia/V/Workspace/my_config/hypr/scripts/automonitor_resolution.sh TODO:

-- monitor=HDMI-A-1,1920x1080@120.00Hz,0x0,1.33
-- monitor=eDP-1,1920x1080,-1200x150,1.6

-- exec-once = hyprctl setcursor breeze_cursors 24
hl.config({
	input = {
		kb_layout = "eu",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		numlock_by_default = true,
		follow_mouse = 2,
		mouse_refocus = false,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			scroll_factor = 1,
		},
		sensitivity = 0,
		-- accel_profile = "adaptative"
	},
})
hl.device({
	name = "logitech-g703-lightspeed-wireless-gaming-mouse-w/-hero-2",
	sensitivity= -0.8
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
