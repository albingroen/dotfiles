local wezterm = require("wezterm")
local config = {}

local act = wezterm.action

-- Basics
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.6 }
config.send_composed_key_when_right_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true
config.window_close_confirmation = "NeverPrompt"
config.colors = { scrollbar_thumb = "#444444" }
config.color_scheme = "GruvboxDarkHard"
config.use_fancy_tab_bar = false
config.enable_scroll_bar = true
config.tab_bar_at_bottom = true
config.tab_max_width = 1000
config.line_height = 1.2
config.font_size = 14

config.keys = {
	-- Navigate panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Spawn and kill panes
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
}

return config
