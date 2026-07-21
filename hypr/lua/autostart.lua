--    ___       __           __           __
--   / _ |__ __/ /____  ___ / /____ _____/ /_
--  / __ / // / __/ _ \(_-</ __/ _ `/ __/ __/
-- /_/ |_\_,_/\__/\___/___/\__/\_,_/_/  \__/
--


hl.on("hyprland.start", function ()
    hl.exec_cmd("noctalia")
    -- hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("clipse -listen")
end)
