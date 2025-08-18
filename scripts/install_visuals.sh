#!/data/data/com.termux/files/usr/bin/bash

# This script will install visual enhancements.

# --- Colors for output ---
C_RESET='\033[0m'
C_BLUE='\033[0;34m'

info() {
    printf "${C_BLUE}%s${C_RESET}\n" "$1"
}

info "--- Installing Visual Enhancements ---"

info "Installing eza (a modern replacement for ls)..."
pkg install -y eza

info "Installing bat (a cat clone with syntax highlighting)..."
pkg install -y bat

info "Installing neofetch..."
pkg install -y neofetch

info "Installing unzip..."
pkg install -y unzip

info "Creating fonts directory..."
mkdir -p ~/.dotfiles/fonts

# --- Function to install fonts ---
install_fonts() {
    info "Downloading and installing fonts..."

    # Create a temporary directory for downloads
    TMP_DIR=$(mktemp -d)

    # Fira Code
    info "Downloading Fira Code Nerd Font..."
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip -o $TMP_DIR/FiraCode.zip
    unzip -o $TMP_DIR/FiraCode.zip -d ~/.dotfiles/fonts/ 'FiraCodeNerdFont-Regular.ttf'

    # JetBrains Mono
    info "Downloading JetBrains Mono Nerd Font..."
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o $TMP_DIR/JetBrainsMono.zip
    unzip -o $TMP_DIR/JetBrainsMono.zip -d ~/.dotfiles/fonts/ 'JetBrainsMonoNerdFont-Regular.ttf'

    # Hack
    info "Downloading Hack Nerd Font..."
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip -o $TMP_DIR/Hack.zip
    unzip -o $TMP_DIR/Hack.zip -d ~/.dotfiles/fonts/ 'HackNerdFont-Regular.ttf'

    # Meslo (recommended for Powerlevel10k)
    info "Downloading MesloLGS NF..."
    curl -fLo ~/.dotfiles/fonts/MesloLGS-NF-Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

    # Clean up
    rm -rf $TMP_DIR

    info "Fonts installed successfully."
}

# --- Function to install Zsh themes ---
install_zsh_themes() {
    info "Installing custom Zsh themes..."
    if [ -d "$HOME/.oh-my-zsh/custom/themes" ]; then
        cp -f ~/.dotfiles/zsh_themes/* ~/.oh-my-zsh/custom/themes/
        info "Custom Zsh themes installed."
    else
        info "Oh My Zsh not found. Skipping Zsh theme installation."
    fi
}

# --- Function to install neofetch config ---
install_neofetch_config() {
    info "Installing custom neofetch configuration..."
    mkdir -p ~/.config/neofetch
    cp -f ~/.dotfiles/.config/neofetch/config.conf ~/.config/neofetch/
    info "Neofetch configuration installed."
}

# --- Function to install rxfetch ---
install_rxfetch() {
    info "Installing rxfetch..."
    mkdir -p ~/.local/bin
    cp -f ~/.dotfiles/scripts/rxfetch.sh ~/.local/bin/rxfetch
    chmod +x ~/.local/bin/rxfetch
    info "rxfetch installed."
}

# --- Function to prompt for color toys installation ---
prompt_install_colortoys() {
    echo ""
    read -p "Do you want to install the color toys (animated pipes, pacman, etc.)? (y/n): " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        chmod +x ./scripts/install_colortoys.sh
        ./scripts/install_colortoys.sh
    else
        info "Skipping color toys installation."
    fi
}

# --- Main installation logic for visuals ---
install_fonts
install_zsh_themes
install_neofetch_config
install_rxfetch
prompt_install_colortoys

echo ""
info "--- Visual Enhancements Installation Complete ---"
info "Here are some of the new commands you can use:"
info "  - eza: A modern replacement for ls. Your 'ls', 'la', 'll' aliases have been updated."
info "  - bat: A replacement for cat with syntax highlighting. Your 'cat' alias has been updated."
info "  - chcolor: Change the terminal colorscheme."
info "  - chfont: Change the terminal font."
info "  - chzsh: Change the Zsh theme."
info "  - rxfetch: A custom system information fetcher."
info "If you installed the color toys, you can use aliases like 'pipesx', 'pacman', etc."
info "Restart Termux for all changes to take effect."
