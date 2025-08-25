#!/usr/bin/env bash

# This script installs additional CLI tools using go and npm.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

warn() {
    printf "${C_YELLOW}%s${C_RESET}\n" "$1"
}

success() {
    printf "${C_GREEN}%s${C_RESET}\n" "$1"
}

info "--- Installing Additional CLI Tools ---"

# --- Install crush ---
if command -v go &> /dev/null; then
    info "Installing crush (from charmbracelet) with go..."
    go install github.com/charmbracelet/crush@latest
else
    warn "go command not found. Skipping installation of crush."
fi

# --- Install gemini-cli ---
if command -v npm &> /dev/null; then
    info "Installing gemini-cli (from Google) with npm..."
    npm install -g @google/gemini-cli
else
    warn "npm command not found. Skipping installation of gemini-cli."
fi

success "--- Additional CLI Tools Installation Complete ---"
