#!/data/data/com.termux/files/usr/bin/bash

# This script installs a set of base development tools.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

info "--- Installing Base Development Tools ---"

pkg install -y \
    build-essential \
    cmake \
    clang \
    openssh \
    micro \
    fzf \
    zoxide \
    rust \
    golang \
    starship \
    termux-api

info "--- Base Development Tools Installation Complete ---"
