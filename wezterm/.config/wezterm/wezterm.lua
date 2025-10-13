local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.9

config.font = wezterm.font("MesloLGM Nerd Font", { weight = 500 })
config.font_size = 12

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

return config
