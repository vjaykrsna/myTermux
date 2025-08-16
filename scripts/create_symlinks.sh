#!/data/data/com.termux/files/usr/bin/bash

# This script creates symlinks for the dotfiles in this repository.
# It will back up any existing files before creating the symlinks.

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

# --- Symlink creation logic ---

# Get the directory of the script
# This will be the root of the dotfiles repository
DOTFILES_DIR=$(pwd)
HOME_DIR=$HOME

# --- Files and directories to symlink ---
# Add any other files or directories you want to symlink here.
# The key is the source file/directory in the dotfiles repo,
# and the value is the destination in the home directory.
declare -A symlinks=(
    ["$DOTFILES_DIR/.config"]="$HOME_DIR/.config"
)

# --- Main symlinking function ---
create_symlinks() {
    info "--- Starting to create symlinks ---"

    BACKUP_DIR="$HOME_DIR/dotfiles_backup_$(date +%Y-%m-%d_%H-%M-%S)"

    for src in "${!symlinks[@]}"; do
        dest="${symlinks[$src]}"
        dest_dir=$(dirname "$dest")

        # Create the destination directory if it doesn't exist
        mkdir -p "$dest_dir"

        # If the destination file/symlink exists, back it up
        if [ -e "$dest" ] || [ -L "$dest" ]; then
            # Create backup directory if it doesn't exist
            if [ ! -d "$BACKUP_DIR" ]; then
                mkdir -p "$BACKUP_DIR"
                success "Created backup directory at $BACKUP_DIR"
            fi
            warn "Backing up existing $dest to $BACKUP_DIR"
            mv -f "$dest" "$BACKUP_DIR/"
        fi

        # Create the symlink
        info "Creating symlink for $src -> $dest"
        ln -s "$src" "$dest"
    done

    success "--- Symlinks created successfully! ---"
}

# --- Run the script ---
create_symlinks
