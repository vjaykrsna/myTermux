#!/data/data/com.termux/files/usr/bin/bash

# A modular script to set up a Termux environment

# --- Colors for output ---
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'

# --- Helper functions ---
info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

success() {
    printf "${C_GREEN}%s${C_RESET}\n" "$1"
}

warn() {
    printf "${C_YELLOW}%s${C_RESET}\n" "$1"
}

error() {
    printf "${C_RED}%s${C_RESET}\n" "$1"
    exit 1
}

# --- Core setup ---
core_setup() {
    info "--- Starting Core Setup ---"

    # Update and upgrade packages
    pkg update -y && pkg upgrade -y

    # Install essential packages
    pkg install -y zsh git curl wget

    # Set Zsh as the default shell
    chsh -s zsh

    success "--- Core Setup Complete ---"
}

# --- Modular installation functions ---
# The functions are called directly in the main logic

# --- Main menu ---
main_menu() {
    clear
    info "--- Termux Setup Menu ---"
    echo "Select the components you want to install:"
    echo "1) Base Development Tools (recommended)"
    echo "2) Python Environment"
    echo "3) Node.js Environment"
    echo "4) Neovim (modern text editor)"
    echo "5) Theming (oh-my-zsh, powerlevel10k, etc.)"
    echo "6) Visual Enhancements (eza, bat, themes)"
    echo "----------------------------------------"
    echo "s) Start installation"
    echo "q) Quit"
    echo ""
    read -p "Enter your choice(s) (e.g., 125s): " choices
}

# --- Main script logic ---
main() {
    core_setup

    while true; do
        main_menu

        if [[ "$choices" == *"q"* ]]; then
            info "Exiting setup. No changes have been made."
            exit 0
        fi

        if [[ "$choices" == *"s"* ]]; then
            break
        fi

        warn "Invalid selection. Please include 's' to start the installation or 'q' to quit."
        sleep 2
    done

    if [[ "$choices" == *"1"* ]]; then
        ./scripts/install_base_tools.sh
    fi
    if [[ "$choices" == *"2"* ]]; then
        ./scripts/install_python.sh
    fi
    if [[ "$choices" == *"3"* ]]; then
        ./scripts/install_nodejs.sh
    fi
    if [[ "$choices" == *"4"* ]]; then
        ./scripts/install_neovim.sh
    fi
    if [[ "$choices" == *"5"* ]]; then
        ./scripts/install_theming.sh
    fi
    if [[ "$choices" == *"6"* ]]; then
        ./scripts/install_visuals.sh
    fi

    success "--- All selected components have been installed! ---"
    info "Please restart Termux for all changes to take effect."
}

# --- Run the script ---
main
