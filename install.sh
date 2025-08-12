#!/usr/bin/env bash
#
# MyTermux Installer
#
# This script will install and configure the dotfiles.
#

# --- Variables ---
DOTFILES_DIR=$(pwd)
HELPER_DIR="$DOTFILES_DIR/scripts"

# --- Main Function ---
main() {
  set -e

  # Source all helper and library scripts
  for file in "$HELPER_DIR"/*.sh; do source "$file"; done
  for file in "$HELPER_DIR"/library/*.sh; do source "$file"; done

  display_banner
  echo "Starting setup..."

  start_animation "Installing dotfiles..."
  install_dotfiles
  stop_animation $?

  start_animation "Installing themes..."
  install_themes
  stop_animation $?

  start_animation "Installing fonts..."
  install_fonts
  stop_animation $?

  start_animation "Installing Zsh themes..."
  install_zsh_themes
  stop_animation $?

  start_animation "Installing visual tools..."
  install_visual_tools
  stop_animation $?

  start_animation "Installing Tmux config..."
  install_tmux
  stop_animation $?

  start_animation "Installing fun tools..."
  install_fun_tools
  stop_animation $?

  echo "Setup complete!"
}

main
