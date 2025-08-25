#!/data/data/com.termux/files/usr/bin/bash

# This script installs Node.js (LTS).
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
    warn "This script is designed for Termux. Skipping Node.js installation."
    exit 0
fi

info "--- Installing Node.js (LTS) Environment (Termux) ---"

pkg install -y nodejs-lts

info "--- Node.js Installation Complete ---"
