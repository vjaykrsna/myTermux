#!/usr/bin/env bash
#
# Zsh Theme Helper
#
# This script contains functions for managing Zsh themes.
#

# --- Variables ---
ZSH_THEMES_DIR="$HOME/.oh-my-zsh/themes"

# --- Functions ---
chzsh() {
    if [ ! -d "$ZSH_THEMES_DIR" ]; then
        echo "Zsh themes directory not found: $ZSH_THEMES_DIR"
        return 1
    fi

    local theme=$(ls "$ZSH_THEMES_DIR" | fzf --prompt="Select a Zsh theme: ")
    if [ -n "$theme" ]; then
        sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"$theme\"/" "$HOME/.zshrc"
        echo "Zsh theme changed to $theme. Please restart your terminal."
    fi
}

install_zsh_themes() {
    echo "Installing Zsh themes..."
    if [ ! -d "$ZSH_THEMES_DIR" ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git --depth=1 "$HOME/.oh-my-zsh"
    else
        echo "Oh My Zsh directory already exists, skipping clone."
    fi
    echo "Zsh themes installation complete."
}
