#!/usr/bin/env bash
#
# Environment Switcher
#
# This script allows you to switch between different shells and editors.
#

# --- Functions ---
switch_shell() {
    echo "Select a shell to switch to:"
    local shell=$(echo -e "zsh\nbash\nfish" | fzf)
    if [ -n "$shell" ]; then
        chsh -s "$(which "$shell")"
        echo "Shell changed to $shell. Please restart your terminal."
    fi
}

switch_editor() {
    echo "Select an editor to set as default:"
    local editor=$(echo -e "nvim\nnano\nmicro" | fzf)
    if [ -n "$editor" ]; then
        export EDITOR="$editor"
        export VISUAL="$editor"
        echo "Default editor changed to $editor"
    fi
}

# --- Main Logic ---
echo "What would you like to switch?"
select choice in "Shell" "Editor" "Quit"; do
    case $choice in
        Shell)
            switch_shell
            break
            ;;
        Editor)
            switch_editor
            break
            ;;
        Quit)
            break
            ;;
    esac
done
