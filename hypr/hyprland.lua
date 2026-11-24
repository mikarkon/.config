-- Hyprland main config (Lua)
-- Rewritten from the old INI hyprland.conf.
-- Docs: https://wiki.hypr.land/configuring/
--
-- Each section is loaded with require() in its own scope, so an error
-- in one file won't stop the rest of the config.

require("configs.settings")
require("configs.decoration")
require("configs.exec")
require("configs.wrules")
require("configs.keybinds")
require("configs.monitor")
require("configs.animation")

-- (old: #source=$configs/enviroment.conf — was commented out, no file existed)
