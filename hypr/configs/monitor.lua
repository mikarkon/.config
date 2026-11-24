-- Monitors (formerly monitor.conf)
-- See https://wiki.hypr.land/configuring/core/monitors/ for more

hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })

-- Dual monitor example on G15 Strix
-- eDP-1 is the built in monitor while DP-1 is external
-- Both monitors here are at 1440 and 165Hz
-- DP-1 is on the left and eDP-1 is on the right
-- hl.monitor({ output = "DP-1",  mode = "2560x1440@165", position = "0x0",    scale = 1 })
-- hl.monitor({ output = "eDP-1", mode = "2560x1440@165", position = "2560x0", scale = 1 })
