-- Input, misc and layout options (formerly settings.conf)
-- See https://wiki.hypr.land/configuring/core/config-options/ for all options

hl.config({
    input = {
        kb_layout  = "us, ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:ctrl_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
        },

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },

    misc = {
        disable_hyprland_logo = true,
    },

    -- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
    dwindle = {
        preserve_split = true, -- you probably want this
    },

    -- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
    master = {
        -- old: new_status = true (new windows become master)
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/configuring/core/binds/gestures/ for more
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
    name        = "epic-mouse-V1",
    sensitivity = -0.5,
})
