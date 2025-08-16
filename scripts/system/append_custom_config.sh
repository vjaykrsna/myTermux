#!/data/data/com.termux/files/usr/bin/bash

# This script appends the custom dotfiles configuration to the ~/.zshrc file.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

info "Appending custom configuration to ~/.zshrc"

# The custom configuration snippet to append
CUSTOM_CONFIG_SNIPPET="
# ------------------------------------------------------------------------------
# MODULAR CONFIGURATION (from dotfiles)
# ------------------------------------------------------------------------------
# Source custom files for aliases, functions, etc.
# These files are located in ~/.config/zsh/

ZSH_CUSTOM_DIR=\"\$HOME/.config/zsh\"

# Source aliases
if [ -f \"\$ZSH_CUSTOM_DIR/aliases.zsh\" ]; then
    source \"\$ZSH_CUSTOM_DIR/aliases.zsh\"
fi

# Source functions
if [ -f \"\$ZSH_CUSTOM_DIR/functions.zsh\" ]; then
    source \"\$ZSH_CUSTOM_DIR/functions.zsh\"
fi

# Source environment variables
if [ -f \"\$ZSH_CUSTOM_DIR/env.zsh\" ]; then
    source \"\$ZSH_CUSTOM_DIR/env.zsh\"
fi
"

# Append the snippet to the new .zshrc
# -e interprets backslash escapes
echo -e "$CUSTOM_CONFIG_SNIPPET" >> ~/.zshrc
