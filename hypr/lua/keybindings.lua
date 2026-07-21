-- -----------------------------------------------------
-- Key bindings
-- name: "Keybindings"
-- -----------------------------------------------------

local mainMod = "SUPER"
local ipc = "noctalia msg "

--Launching")
-- hl.bind(mainMod .. " + SPACE",hl.dsp.exec_cmd(" rofi -show drun ")
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " +  ALT + SPACE", hl.dsp.exec_cmd("hyprctl switchkxblayout at-translated-set-2-keyboard next"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("systemctl restart kanata"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots -f"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only -f"))
-- hl.bind(mainMod .. " + S",hl.dsp.exec_cmd(" hyprshot -m region --clipboard-only -f")

--Modifying windows")
hl.bind(mainMod .. " + Q", hl.dsp.window.close({ "active" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + Z", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- ALT + LMB: Move a window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- ALT + RMB: Resize a window
--Moving")
hl.bind(mainMod .. " + M", hl.dsp.workspace.swap_monitors({ monitor1 = "eDP-1", monitor2 = "HDMI-A-1" }))
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(" ~/V/Workspace/my_config/hypr/scripts/monitor_swap_old.sh"))
local vimkeys = { J = "down", H = "left", L = "right", K = "up" }
for key, direction in pairs(vimkeys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
	hl.bind(mainMod .. "+ SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))

-- --Utilities")
-- -- hl.bind(mainMod .. " + S",hl.dsp.exec_cmd(" ipc plugin:screen-shot-and-record screenshot")
-- -- hl.bind(mainMod .. " + SHIFT S",hl.dsp.exec_cmd(" ipc plugin:screen-shot-and-record record")
-- -- hl.bind(mainMod .. " + O",hl.dsp.exec_cmd(" ipc plugin:screen-shot-and-record ocr")
-- hl.bind(mainMod .. " + V",hl.dsp.exec_cmd(" kitty --class floating clipse")
-- hl.bind(mainMod .. " + I",hl.dsp.exec_cmd(" kitty --class floating sh ~/V/Workspace/my_config/hypr/scripts/runner.sh")
-- -- hl.bind(mainMod .. " + I",hl.dsp.exec_cmd(" nautilus")
-- hl.bind(mainMod .. " + G",hl.dsp.exec_cmd(" ~/V/Workspace/my_config/hypr/conf/gaming_toggle.sh")
--
--
-- --Media control")
-- -- hl.bind(","XF86AudioMute"," exec"," ipc volume muteOutput")
-- hl.bind(","XF86AudioPlay"," exec"," playerctl play-pause                            ")
-- hl.bind(","XF86AudioPause"," exec"," playerctl pause                                ")
-- hl.bind(","XF86AudioNext"," exec"," playerctl next                                  ")
-- hl.bind(","XF86AudioPrev"," exec"," playerctl previous                              ")
-- hl.bind(","XF86AudioMicMute"," exec"," pactl set-source-mute @DEFAULT_SOURCE@ toggle")
--
