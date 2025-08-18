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
    termux-api \
    aria2

info "Installing apt-fast script..."
# The current working directory of the script will be the chezmoi source dir
cp -f "assets/bin/apt-fast" "$PREFIX/bin/apt-fast"
chmod +x "$PREFIX/bin/apt-fast"

info "Configuring make for parallel execution..."
mkdir -p "$PREFIX/etc"
echo 'MAKEFLAGS = -j$(nproc)' > "$PREFIX/etc/make.conf"

info "--- Base Development Tools Installation Complete ---"
