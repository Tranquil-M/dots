hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "satty-always-floating",
    match = { class = "^(com.gabm.satty)" },

    float = true,
    size = {800, 600},
    center = true,
})

hl.window_rule({
    name  = "blueman-always-floating",
    match = { class = "^(blueman-manager)" },

    float = true,
    size = {1000, 600},
    center = true,
})

-- hl.layer_rule({
--     name = "noctalia",
--     match = {
--         namespace = "noctalia-background-.*$"
--     },
--     ignore_alpha = 0.5,
--     blur = true,
--     blur_popups = true
-- })

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

hl.window_rule({
    match = { class = "^(discord)$" },
    render_unfocused = true
})

hl.window_rule({
  match = {
    title = "^(Picture-in-Picture|Picture in picture|Picture-In-Picture)$",
  },

  float = true,
  pin = true,

  size = { "monitor_w * 0.25", "monitor_h * 0.25" },
  move = { "(monitor_w - (window_w * 0.1))", "(monitor_h - (window_h * 0.25))" },

  animation = "slide right",
})

hl.window_rule({
    match = {
        title = "Noctalia Settings",
    },

    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.8" },
})
