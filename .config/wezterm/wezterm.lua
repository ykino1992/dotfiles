local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 10
config.color_scheme = 'Catppuccin Macchiato'

config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

config.show_new_tab_button_in_tab_bar = false

config.font = wezterm.font("HackGen Console NF")

-- Key Bindings
config.leader = { key = ",", mods = "CTRL", timeout_milliseconds = 2000 }
config.send_composed_key_when_left_alt_is_pressed = true
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

-- full screen on startup
wezterm.on("gui-startup", function()
  local _, _, window = wezterm.mux.spawn_window {}
  window:gui_window():maximize()
end)

return config
