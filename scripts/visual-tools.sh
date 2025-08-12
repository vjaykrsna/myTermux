#!/usr/bin/env bash
#
# Visual Tools Helper
#
# This script installs optional visual tools.
#

# --- Functions ---
install_visual_tools() {
    echo "Installing visual tools..."
    pkg install -y rxfetch nyancat colortoys
    echo "Visual tools installation complete."
}
