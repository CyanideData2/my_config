--  _   _                  _                 _
-- | | | |_   _ _ __  _ __| | __ _ _ __   __| |
-- | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
-- |  _  | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|
--
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Desktop environment
-- -----------------------------------------------------
require("lua.env")
require("lua.autostart")
require("lua.periferals")

-- -----------------------------------------------------
-- Themes
-- -----------------------------------------------------
-- require("themes.kanawaga.conf")
local colors = require("lua.colors")

-- -----------------------------------------------------
-- Workspaces and windows
-- -----------------------------------------------------
hl.config({
	general = {
		locale = "es"
	},
	misc = {
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
		background_color = colors.surface,
	},
})
require("lua.window")
require("lua.layout")
require("lua.keybindings")


-- This loads Noctalia-generated Hyprland colors.
dofile("/home/julia/.config/hypr/noctalia/noctalia-colors.lua")
