local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    default_cursor_style = "SteadyBar",
    automatically_reload_config = true,
    window_close_confirmation = "NeverPrompt",
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "TITLE | RESIZE",
    check_for_updates = false,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    font_size = 12.5,
    font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
    enable_tab_bar = false,
    window_padding = {
      left = 3,
      right = 3,
      top = 0,
      bottom = 0,
    },
  background = {
    {
      source = {
        File = "/home/" .. os.getenv("USER") .. "/.config/wezterm/totoro.jpeg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      -- attachment = { Parallax = 0.3 },
      -- width = "100%",
      -- height = "100%",
    },
    {
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0.55,
    },
  },
}

return config
