#!/data/data/com.termux/files/usr/bin/bash

# This script installs the YouTube-DL feature.

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

info "--- Installing YouTube-DL Feature ---"

# --- Install dependencies ---
info "Installing dependencies: python, ffmpeg..."
pkg install -y python ffmpeg

# --- Install yt-dlp ---
info "Installing yt-dlp..."
pip install yt-dlp --break-system-packages

# --- Create directories ---
info "Creating directories..."
mkdir -p "$HOME/storage/shared/Youtube-DL"
mkdir -p "$HOME/.config/yt-dlp"
mkdir -p "$HOME/.termux/bin"

# --- Copy configuration files ---
info "Copying configuration files..."
cp -f "assets/youtube-dl/config" "$HOME/.config/yt-dlp/config"
cp -f "assets/youtube-dl/sponsorblock.conf" "$HOME/.config/yt-dlp/sponsorblock.conf"

# --- Copy and set up termux-url-opener ---
info "Setting up termux-url-opener..."
cp -f "assets/youtube-dl/termux-url-opener" "$HOME/.termux/bin/termux-url-opener"
chmod +x "$HOME/.termux/bin/termux-url-opener"

success "--- YouTube-DL Feature Installation Complete ---"
info "You can now share YouTube links to Termux to download them."
