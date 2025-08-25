#!/data/data/com.termux/files/usr/bin/bash

# This script creates symlinks for the dotfiles in this repository.
# It backs up any existing files to the specified backup directory.

# --- Colors for output ---
C_RESET='\033[0m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'

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

# --- Main logic ---

# Get the backup directory from the first argument
if [ -z "$1" ]; then
    error "Backup directory not provided. Usage: ./create_symlinks.sh <backup_dir>"
fi
BACKUP_DIR="$1"

# Determine the script's own directory to find the dotfiles root
# This makes the script runnable from anywhere
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
DOTFILES_DIR=$(dirname "$SCRIPT_DIR")
HOME_DIR=$HOME

# --- Files and directories to symlink ---
# The key is the source file/directory in the dotfiles repo,
# and the value is the destination.
declare -A symlinks=(
    ["$DOTFILES_DIR/.zshrc"]="$HOME_DIR/.zshrc"
    ["$DOTFILES_DIR/.config"]="$HOME_DIR/.config"
    ["$DOTFILES_DIR/assets/apt/sources.list"]="$PREFIX/etc/apt/sources.list"
)

info "--- Starting to create symlinks ---"
has_backed_up=false

for src in "${!symlinks[@]}"; do
    dest="${symlinks[$src]}"
    dest_dir=$(dirname "$dest")

    # Create the destination directory if it doesn't exist
    mkdir -p "$dest_dir"

    # If the destination file/symlink exists, back it up
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        # Create backup directory only when needed
        if ! $has_backed_up; then
            mkdir -p "$BACKUP_DIR"
            success "Created backup directory at $BACKUP_DIR"
            has_backed_up=true
        fi
        warn "Backing up existing $dest to $BACKUP_DIR"
        mv -f "$dest" "$BACKUP_DIR/"
    fi

    # Create the symlink
    info "Creating symlink for $src -> $dest"
    ln -s "$src" "$dest"
done

success "--- Symlinks created successfully! ---"
