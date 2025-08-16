# ~/.zshrc
#
# Main Zsh configuration file.
# This file is designed to be minimal and easy to understand.
# It serves as a template for the installer.

# ------------------------------------------------------------------------------
# ENCODING
# ------------------------------------------------------------------------------
export LANG=en_US.UTF-8

# ------------------------------------------------------------------------------
# EDITOR
# ------------------------------------------------------------------------------
# Set the default editor. I'll use nano as a safe default.
# The user can change this to 'micro', 'neovim', or whatever they prefer.
export EDITOR='nano'
export VISUAL='nano'

# ------------------------------------------------------------------------------
# ZSH CONFIGURATION
# ------------------------------------------------------------------------------

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups # Ignore duplicate commands
setopt hist_reduce_blanks # Remove superfluous blanks

# Shell options
setopt auto_cd # cd to a directory by just typing its name
setopt auto_pushd # automatically pushd on cd
setopt pushd_ignore_dups # don't push duplicate directories
setopt correct # command correction
setopt notify # report status of background jobs immediately

# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
# Add local bin directories to the path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"


# ------------------------------------------------------------------------------
# PROMPT
# ------------------------------------------------------------------------------
# A simple, clean, and effective prompt.
# Shows: [user@hostname] path/to/current/dir
# The '%' at the end is a Zsh thing. It shows a '%' for normal users and a '#' for root.
PROMPT='[%n@%m] %~ %# '

# For a more advanced prompt, consider installing Starship or Powerlevel10k.
# This can be done via the 'theming' option in the install.sh script.

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------
# Initialize the Zsh completion system.
autoload -U compinit
compinit

# ------------------------------------------------------------------------------
# KEYBINDINGS
# ------------------------------------------------------------------------------
# Use emacs keybindings
bindkey -e

# ------------------------------------------------------------------------------
# GREETING
# ------------------------------------------------------------------------------
# You can add a fun greeting here if you like.
# echo "Welcome back, $(whoami)!"
