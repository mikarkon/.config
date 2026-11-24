-- Keybindings (formerly keybinds.conf)
-- See https://wiki.hypr.land/configuring/core/binds/ for more

local mainMod = "SUPER" -- sets the "Windows" key as main modifier

-- Applications
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty")) -- open the terminal
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("ungoogled-chromium")) -- open browser
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd('ungoogled-chromium --proxy-server="socks5://127.0.0.1:1080"')) -- open browser with proxy
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("Telegram")) -- open tg
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
-- no "& disown" needed: hl.dsp.exec_cmd spawns an async process
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("(killall -9 waybar || true) && waybar")) -- restart waybar
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("keepass"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("yandex-music"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("pkill Telegram")) -- kill tg
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("OBSIDIAN_USE_WAYLAND=1 obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland")) -- open obsidian
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.kill()) -- close the active window
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock")) -- lock the screen
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout --protocol layer-shell")) -- show the logout window
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit()) -- exit Hyprland
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar")) -- show the graphical file browser
hl.bind(mainMod .. " + V", hl.dsp.window.float()) -- allow a window to float
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("wofi")) -- show the graphical app launcher
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')) -- take a screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + a", hl.dsp.exec_cmd("~/.config/hypr/configs/wireshark.sh"))
hl.bind(mainMod .. " + SHIFT + a", hl.dsp.exec_cmd("~/.config/hypr/configs/wireshark-custom.sh"))

-- Move windows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float()) -- toggle floating

-- Cycle windows (classic alt-tab: cycle + bring to top)
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end) -- step forward between windows
hl.bind("ALT + SHIFT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
    hl.dispatch(hl.dsp.window.bring_to_top())
end) -- step backwards between windows

-- Cycle workspaces
hl.bind(mainMod .. " + Tab",        hl.dsp.focus({ workspace = "e+1" })) -- step forward between workspaces
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" })) -- step backward between workspaces

-- ROG G15 Strix (2021) specific binds (raw keycodes use the code: prefix)
hl.bind("code:156", hl.dsp.exec_cmd("rog-control-center")) -- ASUS Armory crate key
hl.bind("code:211", hl.dsp.exec_cmd("asusctl profile -n; pkill -SIGRTMIN+8 waybar")) -- fan profile key switch between power profiles
hl.bind("code:121", hl.dsp.exec_cmd("pamixer -t")) -- speaker mute FN+F1
hl.bind("code:122", hl.dsp.exec_cmd("pamixer -d 5")) -- volume lower key
hl.bind("code:123", hl.dsp.exec_cmd("pamixer -i 5")) -- volume higher key
hl.bind("code:256", hl.dsp.exec_cmd("pamixer --default-source -t")) -- mic mute key
hl.bind("code:232", hl.dsp.exec_cmd("brightnessctl set 10%-")) -- screen brightness down FN+F7
hl.bind("code:233", hl.dsp.exec_cmd("brightnessctl set 10%+")) -- screen brightness up FN+F8
hl.bind("code:237", hl.dsp.exec_cmd("brightnessctl -d asus::kbd_backlight set 33%-")) -- keyboard brightness down FN+F2
hl.bind("code:238", hl.dsp.exec_cmd("brightnessctl -d asus::kbd_backlight set 33%+")) -- keyboard brightness up FN+F3
hl.bind("code:210", hl.dsp.exec_cmd("asusctl led-mode -n")) -- switch keyboard RGB profile FN+F4

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
