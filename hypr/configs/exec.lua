-- Environment variables + autostart (formerly exec.conf)
-- See https://wiki.hypr.land/configuring/core/autostart/ and
--      https://wiki.hypr.land/configuring/core/environment-variables/ for more

-- old: env = QT_QPA_PLATFORMTHEME,qt6ct   (for Qt apps)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- old: exec = ...  (runs on every config reload)
hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Dracula"') -- for GTK3 apps
hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"') -- for GTK4 apps

-- old: exec-once = ...  (runs once at session start, not on config reload)
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("/usr/bin/hyprland-per-window-layout")
    hl.exec_cmd("swaybg -m fill -i ~/.config/hypr/doomed_novosib-modified.jpg")
end)
