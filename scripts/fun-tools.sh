#!/usr/bin/env bash

# Helper for installing optional "fun" tools

install_fun_tools() {
    echo "Installing fun tools..."
    local bin_dir="$HOME/.local/bin"
    local toys_dir="inspiration/myTermux/.scripts/toys"

    echo "Creating $bin_dir for fun scripts..."
    mkdir -p "$bin_dir"

    echo "Copying toy scripts to $bin_dir..."
    cp "$toys_dir"/* "$bin_dir/"

    echo "Making scripts executable..."
    chmod +x "$bin_dir"/*

    echo "Fun tools installed."
}
