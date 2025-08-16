#!/data/data/com.termux/files/usr/bin/bash

# This script installs and configures theming options for Zsh.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'
C_YELLOW='\033[0;33m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

warn() {
    printf "${C_YELLOW}%s${C_RESET}\n" "$1"
}

# --- Oh My Zsh Installation ---
install_oh_my_zsh() {
    info "--- Installing Oh My Zsh ---"
    # The Oh My Zsh installer will create a new .zshrc.
    # We will let it do that, and then we'll append our custom configuration.
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Append the custom configuration
    info "--- Appending custom configuration to new .zshrc ---"
    chmod +x scripts/system/append_custom_config.sh
    ./scripts/system/append_custom_config.sh

    # Set a simple, clean theme
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

    info "--- Oh My Zsh Installation Complete ---"
}

# --- Powerlevel10k Installation ---
install_powerlevel10k() {
    info "--- Installing Powerlevel10k ---"

    # Install the Powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # Set the theme in .zshrc
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

    # Install the recommended font
    info "Installing MesloLGS NF font..."
    mkdir -p ~/.termux
    curl -fLo ~/.termux/font.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

    warn "Powerlevel10k requires a font that supports special characters."
    warn "The recommended font has been downloaded to ~/.termux/font.ttf"
    warn "Please restart Termux and run 'p10k configure' to set up your prompt."

    info "--- Powerlevel10k Installation Complete ---"
}


# --- Main Menu ---
main_menu() {
    clear
    info "--- Theming Menu ---"
    echo "Select a theming option:"
    echo "1) Oh My Zsh (with a simple, clean theme)"
    echo "2) Powerlevel10k (powerful and customizable, requires font installation)"
    echo "----------------------------------------"
    echo "q) Quit"
    echo ""
    read -p "Enter your choice: " choice
}

# --- Main script logic ---
main() {
    main_menu

    case "$choice" in
        1)
            install_oh_my_zsh
            ;;
        2)
            install_oh_my_zsh # Powerlevel10k is a theme for Oh My Zsh
            install_powerlevel10k
            ;;
        q)
            info "Skipping theming."
            exit 0
            ;;
        *)
            warn "Invalid choice. Skipping theming."
            exit 1
            ;;
    esac
}

# --- Run the script ---
main
