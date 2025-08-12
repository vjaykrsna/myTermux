#!/usr/bin/env bash
#
# Font Helper
#
# This script contains functions for managing fonts.
#

# --- Variables ---
FONT_DIR="$HOME/.termux/fonts"

# --- Functions ---
chfont() {
    if [ ! -d "$FONT_DIR" ]; then
        echo "Fonts directory not found: $FONT_DIR"
        return 1
    fi

    local font=$(ls "$FONT_DIR" | fzf --prompt="Select a font: ")
    if [ -n "$font" ]; then
        ln -sf "$FONT_DIR/$font" "$HOME/.termux/font.ttf"
        termux-reload-settings
        echo "Font changed to $font"
    fi
}

install_fonts() {
    echo "Installing fonts..."
    if [ ! -d "$FONT_DIR" ]; then
        git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1 "$FONT_DIR"
    else
        echo "Fonts directory already exists, skipping clone."
    fi
    echo "Fonts installation complete."
}
