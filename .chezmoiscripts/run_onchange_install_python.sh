#!/data/data/com.termux/files/usr/bin/bash

# This script installs Python and related tools.
# It is designed for Termux, but is safe to run on other systems.

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

# --- Main logic ---

# Check if we are in Termux by looking for the 'pkg' command
if ! command -v pkg &> /dev/null; then
    warn "This script is designed for Termux. Skipping Python installation."
    exit 0
fi

info "--- Installing Python Environment (Termux) ---"

# Install Python
pkg install -y python

# Upgrade pip
pip install --upgrade pip --break-system-packages

# Install pipx
pip install pipx --break-system-packages

info "--- Python Environment Installation Complete ---"
