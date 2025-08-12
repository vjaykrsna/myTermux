#!/usr/bin/env bash
#
# Dotfiles Helper
#
# This script creates symlinks for the dotfiles in the home directory.
#

# --- Variables ---
DOTFILES_DIR=$(pwd)
HOME_DIR=~

# --- Functions ---
link_dotfile() {
  local source_file="$1"
  local target_file="$2"

  if [ -e "$target_file" ]; then
    echo "Skipping $target_file, already exists."
  else
    ln -s "$source_file" "$target_file"
    echo "Linked $source_file to $target_file"
  fi
}

install_dotfiles() {
  echo "Installing dotfiles..."

  link_dotfile "$DOTFILES_DIR/.aliases" "$HOME_DIR/.aliases"
  link_dotfile "$DOTFILES_DIR/.functions" "$HOME_DIR/.functions"
  link_dotfile "$DOTFILES_DIR/.exports" "$HOME_DIR/.exports"
  link_dotfile "$DOTFILES_DIR/.zshrc" "$HOME_DIR/.zshrc"

  echo "Dotfiles installation complete."
}
