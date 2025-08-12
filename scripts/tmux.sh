#!/usr/bin/env bash
#
# TMUX Helper
#
# This script installs the TMUX configuration and its dependencies.
#

# --- Variables ---
TMUX_THEMEPACK_DIR="$HOME/.tmux-themepack"

# --- Functions ---
install_tmux() {
    echo "Installing TMUX configuration..."
    ln -sf "$(pwd)/.tmux.conf" "$HOME/.tmux.conf"

    if [ ! -d "$TMUX_THEMEPACK_DIR" ]; then
        git clone https://github.com/jimeh/tmux-themepack.git "$TMUX_THEMEPACK_DIR"
    else
        echo "TMUX themepack directory already exists, skipping clone."
    fi

    echo "TMUX configuration installation complete."
}
