-- Window rules (formerly wrules.conf)
-- See https://wiki.hypr.land/configuring/core/rules/window-rules/ for more

hl.window_rule({
    name  = "tile-all",
    match = { class = ".*" },
    tile  = true,
})

hl.window_rule({
    name  = "float-popup",
    match = { class = "^(popup)$" },
    float = true,
})

hl.window_rule({
    name  = "float-context-menu",
    match = { title = "^(context_menu)$" },
    float = true,
})

hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- old: windowrule = match:class ^chromium-browser$, fullscreen_state 1 1
-- fullscreen_state takes "<internal> <client>": 0 none, 1 maximize,
-- 2 fullscreen, 3 maximize and fullscreen (same values as the INI rule)
hl.window_rule({
    name             = "chromium-maximized",
    match            = { class = "^chromium-browser$" },
    fullscreen_state = "1 1",
})
