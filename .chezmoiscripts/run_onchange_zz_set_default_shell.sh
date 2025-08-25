#!/data/data/com.termux/files/usr/bin/bash

# This script sets zsh as the default shell if it is not already.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'

info() { printf "${C_BLUE}%s${C_RESET}\n" "$1"; }
success() { printf "${C_GREEN}%s${C_RESET}\n" "$1"; }
warn() { printf "${C_YELLOW}%s${C_RESET}\n" "$1"; }

# --- Main logic ---

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    warn "zsh is not installed. Skipping setting default shell."
    exit 0
fi

# Check if zsh is already the default shell
if [[ "$SHELL" == */zsh ]]; then
    info "zsh is already the default shell."
else
    info "Setting zsh as the default shell..."
    # The chsh command in Termux does not require a password
    chsh -s zsh
    if [[ "$?" -eq 0 ]]; then
        success "Successfully set zsh as the default shell. Please restart Termux for the change to take effect."
    else
        warn "Failed to set zsh as the default shell. You may need to run 'chsh -s zsh' manually."
    fi
fi
