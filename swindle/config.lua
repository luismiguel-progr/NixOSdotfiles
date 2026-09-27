sloppy_focus = true
bypass_surface_visibility = false
log_level = "silent" -- "silent", "error", "info", "debug"

appearance = {
    inner_border_px    = 1,
    outer_border_px    = 2,
    gaps         = 10,
    smart_gaps   = false,
    root_color   = 0x1f1c17ff,
    inner_border_color = 0x1f1c17ff,
    inner_focus_color  = 0x1f1c17ff,
    inner_urgent_color = 0xff0000ff,
    outer_border_color = 0x1f1c17ff,
    outer_focus_color  = 0x1f1c17ff,
    outer_urgent_color = 0xff0000ff,
    fullscreen_bg = 0x000000ff,
    inactive_opacity = 1.0,
    active_opacity = 1.0,
}

-- Note: the entire input section requires you to restart
-- the compositor once changed

input = {
	repeat_rate = 30,
	repeat_delay = 225,
	tap_to_click = true,
	tap_and_drag = true,
	drag_lock = true,
	natural_scrolling = false,
	disable_while_typing = true,
	left_handed = false,
	middle_button_emulation = false,
	scroll_method = "2fg",
	click_method = "button_areas",
	accel_profile = "adaptive",
	accel_speed = 0.0,
}

autostart = {
	"dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
	"pipewire ",
	"wireplumber ",
	"waybar",
	"pgrep -x foot || foot --server",
	"mako",
	"swaybg -i /home/luis/dotfiles/wallpapers/14.png",
}

rules = {
	--   { app_id = "Gimp",    floating = true,  monitor = -1 },
	--   { app_id = "firefox", tags = 1 << 8,    floating = false, monitor = -1 },
}

monitors = {
	{ name = nil, mfact = 0.90, nmaster = 1, scale = 1, layout = "dwindle", x = -1, y = -1 },

	-- HiDPI laptop example:
	-- { name = "eDP-1", mfact = 0.5, nmaster = 1, scale = 2.0,
	--   layout = "dwindle", x = -1, y = -1 },
}

keybinds = {
	{ mods = { "logo" }, key = "Return", action = "spawn", args = { "foot" } },
	{ mods = { "logo" }, key = "d", action = "spawn", args = { "wofi", "--show", "drun" } },
	{ mods = { "logo" }, key = "e", action = "spawn", args = { "foot", "-e", "goanime" } },
	{ mods = { "logo" }, key = "c", action = "spawn", args = { "swaync-client", "-t", "-sw" } },
	{ mods = { "logo" }, key = "q", action = "killclient" },
	{ mods = { "logo" }, key = "space", action = "togglefloating" },
	{ mods = { "logo" }, key = "f", action = "togglefullscreen" },
	{ mods = { "logo" }, key = "g", action = "togglegaps" },
	{ mods = { "logo" }, key = "h", action = "focusdir", args = { "left" } },
	{ mods = { "logo" }, key = "j", action = "focusdir", args = { "down" } },
	{ mods = { "logo" }, key = "k", action = "focusdir", args = { "up" } },
	{ mods = { "logo" }, key = "l", action = "focusdir", args = { "right" } },
	{ mods = { "logo", "shift" }, key = "H", action = "swapdir", args = { "left" } },
	{ mods = { "logo", "shift" }, key = "J", action = "swapdir", args = { "down" } },
	{ mods = { "logo", "shift" }, key = "K", action = "swapdir", args = { "up" } },
	{ mods = { "logo", "shift" }, key = "L", action = "swapdir", args = { "right" } },
	{ mods = { "logo" }, key = "Tab", action = "view" },
	{ mods = { "logo" }, key = "o", action = "view", args = { "all" } },
	{ mods = { "logo" }, key = "comma", action = "focusmon", args = { "left" } },
	{ mods = { "logo" }, key = "period", action = "focusmon", args = { "right" } },
	{ mods = { "logo", "shift" }, key = "less", action = "tagmon", args = { "left" } },
	{ mods = { "logo", "shift" }, key = "greater", action = "tagmon", args = { "right" } },
	{ mods = { "logo", "shift" }, key = "e", action = "quit" },
	{ mods = {}, key = "XF86AudioRaiseVolume", action = "spawn", args = { "volume", "raise" } },
	{ mods = {}, key = "XF86AudioLowerVolume", action = "spawn", args = { "volume", "lower" } },
	{ mods = {}, key = "XF86AudioMute", action = "spawn", args = { "volume", "mute" } },
	{ mods = {}, key = "XF86MonBrightnessUp", action = "spawn", args = { "brightness", "raise" } },
	{ mods = {}, key = "XF86MonBrightnessDown", action = "spawn", args = { "brightness", "lower" } },
	{ mods = {}, key = "Print", action = "spawn", args = { "shot" } },
}

-- tag switching and window movement between tags

for i = 1, 9 do
	local key = tostring(i)
	local mask = 1 << (i - 1)
	table.insert(keybinds, {
		mods = { "logo" },
		key = key,
		action = "view",
		args = { tostring(mask) },
	})
	table.insert(keybinds, {
		mods = { "logo", "ctrl" },
		key = key,
		action = "toggleview",
		args = { tostring(mask) },
	})
	table.insert(keybinds, {
		mods = { "logo", "shift" },
		key = key,
		action = "tag",
		args = { tostring(mask) },
	})
	table.insert(
		keybinds,
		{ mods = { "logo", "ctrl", "shift" }, key = key, action = "toggletag", args = { tostring(mask) } }
	)
end

buttons = {
	{ mods = { "logo" }, button = "left", action = "moveresize", args = { "move" } },
	{ mods = { "logo" }, button = "middle", action = "togglefloating" },
	{ mods = { "logo" }, button = "right", action = "moveresize", args = { "resize" } },
}
