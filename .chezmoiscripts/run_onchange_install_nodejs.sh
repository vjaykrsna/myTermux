#!/data/data/com.termux/files/usr/bin/bash

# This script installs Node.js (LTS).

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

info "--- Installing Node.js (LTS) Environment ---"

pkg install -y nodejs-lts

info "--- Node.js Installation Complete ---"
