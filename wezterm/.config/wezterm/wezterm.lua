-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Default window size
config.initial_rows = 40
config.initial_cols = 120

-- Default directory
config.default_cwd = "/Users/marcshapiro/computing/contrailcirrus"

-- Don't confirm quit
config.window_close_confirmation = "NeverPrompt"

-- Change the color scheme:
config.color_scheme = "Kanagawa (Gogh)"

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true

-- Prefer to spawn new tab rather than new window
config.prefer_to_spawn_tabs = true

-- Key bindings
config.keys = {
	-- Tabs
	{
		key = "LeftArrow",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},

	-- Panes
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.SplitPane({ direction = "Up" }),
	},
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "f",
		mods = "CMD|SHIFT",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		key = "b",
		mods = "CMD|SHIFT",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},

	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	-- Make Option-Right equivalent to Alt-f; forward-word
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},

	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOF" }),
	},
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
}

-- integrate the tabs into the window title bar
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Inactive pane style
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.5,
}

-- and finally, return the configuration to wezterm
return config
