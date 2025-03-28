-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe", "-NoLogo" }
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.initial_cols = 165
config.initial_rows = 45
config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendKey({ key = "Enter", mods = "SHIFT" }),
	},
	{
		key = "t",
		mods = "SHIFT|ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
}
-- and finally, return the configuration to wezterm
return config
