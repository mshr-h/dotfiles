local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_rows = 40
config.initial_cols = 120

return config
