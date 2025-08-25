#!/data/data/com.termux/files/usr/bin/bash

# This script installs additional CLI tools.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'
C_GREEN='\033[0;32m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

success() {
    printf "${C_GREEN}%s${C_RESET}\n" "$1"
}

info "--- Installing Additional CLI Tools ---"

# --- Install crush ---
info "Installing crush (from charmbracelet)..."
go install github.com/charmbracelet/crush@latest

# --- Install gemini-cli ---
info "Installing gemini-cli (from Google)..."
npm install -g @google/gemini-cli

success "--- Additional CLI Tools Installation Complete ---"
