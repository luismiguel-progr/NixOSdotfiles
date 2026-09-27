#!/bin/sh
# waybar window title for rice 14 (wallpaper_14 theme)
# Prints the focused window class/title using wlroots IPC

# First try swindle's IPC
if command -v swaymsg &>/dev/null; then
    swaymsg -t get_tree 2>/dev/null | \
        jq -r '.nodes[0].nodes[0].nodes[] | select(.focused==true) | "\(.id) \(.window_properties.class // .window_properties.title // "unknown")"' 2>/dev/null | \
        head -1
elif [ -x "$HOME/.local/bin/window.sh" ]; then
    $HOME/.local/bin/window.sh 2>/dev/null
fi

# Fallback: empty string so waybar doesn't error
echo ""