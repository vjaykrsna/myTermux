# ~/.zshrc

# --- Zinit ---
# Zinit will be installed via the main setup script.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# --- Zinit Plugins ---
# Add some popular and useful plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# --- Starship Prompt ---
# Initialize Starship
eval "$(starship init zsh)"

# --- Custom User Configuration ---
# Source custom aliases, functions, and environment variables
# Note: These files are symlinked from the dotfiles repository
if [ -f "$HOME/.config/zsh/aliases.zsh" ]; then
    source "$HOME/.config/zsh/aliases.zsh"
fi
if [ -f "$HOME/.config/zsh/functions.zsh" ]; then
    source "$HOME/.config/zsh/functions.zsh"
fi
if [ -f "$HOME/.config/zsh/env.zsh" ]; then
    source "$HOME/.config/zsh/env.zsh"
fi

# Set default editor
export EDITOR='micro'
export VISUAL='micro'
