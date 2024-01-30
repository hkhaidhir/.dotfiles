-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create a custom color scheme by copying an existing one
-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- custom.background = "#000000"

-- Define the configuration using the config_builder
return {
	-- color_schemes = {
	--     ["Customppuccin"] = custom,
	-- },

	window_decorations = "RESIZE",
	enable_tab_bar = false,
	-- hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	use_fancy_tab_bar = false,
	-- font = wezterm.font("Berkeley Mono Nerd Font Mono"),
	font = wezterm.font("Berkeley Mono"),
	font_size = 13.0,
	window_background_opacity = 0.8,
	default_domain = "WSL:Ubuntu",
	-- undercurl = true,

	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
