#!/usr/bin/env bash
#
# Theming Helper
#
# This script contains functions for managing themes and colors.
#

# --- Variables ---
THEMES_DIR="$HOME/.termux/colors"

# --- Functions ---
chcolor() {
    if [ ! -d "$THEMES_DIR" ]; then
        echo "Themes directory not found: $THEMES_DIR"
        return 1
    fi

    local theme=$(ls "$THEMES_DIR" | fzf --prompt="Select a theme: ")
    if [ -n "$theme" ]; then
        ln -sf "$THEMES_DIR/$theme" "$HOME/.termux/colors.properties"
        termux-reload-settings
        echo "Theme changed to $theme"
    fi
}

install_themes() {
    echo "Installing themes..."
    if [ ! -d "$THEMES_DIR" ]; then
        git clone https://github.com/catppuccin/termux.git "$THEMES_DIR"
    else
        echo "Themes directory already exists, skipping clone."
    fi
    echo "Themes installation complete."
}
