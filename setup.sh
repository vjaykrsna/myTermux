#!/data/data/com.termux/files/usr/bin/bash
#
# Termux Setup Script
#
# This script installs and configures a complete development environment in Termux.
# It exits immediately if any command fails.
#

# Exit on any error
set -e

echo "--- Starting Termux Setup ---"

# 1. System Update
echo "[1/6] Updating package repositories..."
pkg update -y

# 2. Core Development Languages & Runtimes
echo "[2/6] Installing programming languages..."
pkg install -y python ruby golang nodejs perl rust python-pip

# 3. Essential CLI Tools
echo "[3/6] Installing essential CLI tools..."
pkg install -y git wget curl nano micro fish zsh starship

# 4. System & Utility Packages
echo "[4/6] Installing system utilities..."
pkg install -y proot clang net-tools termux-api composer libffi fakeroot libxml2-utils

# 5. Fun & Miscellaneous Packages
echo "[5/6] Installing miscellaneous and fun packages..."
pkg install -y cmatrix figlet cowsay toilet screenfetch ollama openssh unrar unzip ffmpeg sqlite

# 6. Python & Ruby Package Installation
echo "[6/6] Installing Pip and Gem packages..."
pip install --upgrade pip
pip install requests
gem install lolcat

# 7. Final Setup Steps
echo "--- Running Final Setup Steps ---"

# Grant storage access
termux-setup-storage

# Install Youtube-dl from external script
echo "Installing Youtube-dl..."
curl -L https://raw.githubusercontent.com/OzakIOne/termux-youtube-dl/v2.0.1/install.sh | bash

# Run package check from external script
echo "Running package check..."
curl -sL https://gist.githubusercontent.com/santhoshkumar/aba032a6dae1940ed57d860d5a0d963d/raw/bd18596aff92295dbcf102e6570deb5f0561a085/package.sh | bash

echo "--- Setup Complete! ---"
echo "Don't forget to run 'source ~/.zshrc' to apply the new shell configuration."
