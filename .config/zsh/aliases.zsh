# ~/.config/zsh/aliases.zsh
#
# Add your custom aliases in this file.
#
# Aliases are shortcuts for commands. For example, you can type 'l' instead of 'ls -l'.

# ------------------------------------------------------------------------------
# GENERAL
# ------------------------------------------------------------------------------
alias l='ls -lh'
alias la='ls -lha'
alias ll='ls -l'
alias ..='cd ..'
alias ...='cd ../..'

# ------------------------------------------------------------------------------
# GIT
# ------------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gs='git status'
alias gp='git push'
alias gpull='git pull'

# ------------------------------------------------------------------------------
# TERMUX
# ------------------------------------------------------------------------------
alias update='pkg update && pkg upgrade'

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
alias c='clear'
alias x='exit'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
