#!/data/data/com.termux/files/usr/bin/bash

# This script installs Python and related tools.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

info "--- Installing Python Environment ---"

# Install Python
pkg install -y python

# Upgrade pip
pip install --upgrade pip --break-system-packages

# Install pipx
pip install pipx --break-system-packages

info "--- Python Environment Installation Complete ---"
