-- Layout + window decoration options (formerly decoration.conf)
-- See https://wiki.hypr.land/configuring/core/config-options/ for all options

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,

        col = {
            active_border   = "rgb(e2cdf4)",
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding = 3,

        blur = {
            enabled = true,
            size    = 7,
            passes  = 3,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
    },
})
