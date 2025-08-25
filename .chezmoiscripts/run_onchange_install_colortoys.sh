#!/data/data/com.termux/files/usr/bin/bash

# This script installs a collection of "color toy" scripts for fun.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'
C_YELLOW='\033[0;33m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

warn() {
    printf "${C_YELLOW}%s${C_RESET}\n" "$1"
}

# List of color toy scripts to install
TOYS=(
    "256colors2.pl"
    "bloks"
    "colortest"
    "colortest-slim"
    "colorview"
    "colorbars"
    "panes"
    "pipes1"
    "pipes2"
    "pipes2-slim"
    "dna"
    "ghost"
    "jfetch"
    "pacman"
    "pipesx"
    "rains"
    "spacey"
)

# Base URL for the toy scripts
BASE_URL="https://raw.githubusercontent.com/mayTermux/myTermux/main/.scripts/toys"

# Target directory for installation
INSTALL_DIR="$HOME/.local/bin"

# --- Main installation logic ---
main() {
    if ! command -v aria2c &> /dev/null; then
        warn "aria2c command not found. Skipping color toys installation."
        exit 0
    fi

    info "--- Installing Color Toys ---"

    mkdir -p $INSTALL_DIR

    for toy in "${TOYS[@]}"; do
        info "Downloading and installing $toy..."
        aria2c --dir="$INSTALL_DIR" --out="$toy" "$BASE_URL/$toy"
        chmod +x "$INSTALL_DIR/$toy"
    done

    info "--- Color Toys Installation Complete ---"
    info "You can now use the aliases for the color toys."
}

main
