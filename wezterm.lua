local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_rows = 45
config.initial_cols = 120
config.font_size = 13.0

return config
