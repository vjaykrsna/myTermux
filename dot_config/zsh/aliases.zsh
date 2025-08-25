# ~/.config/zsh/aliases.zsh
#
# Add your custom aliases in this file.
#
# Aliases are shortcuts for commands. For example, you can type 'l' instead of 'ls -l'.

# ------------------------------------------------------------------------------
# GENERAL
# ------------------------------------------------------------------------------
alias l='eza --icons -lgh --group-directories-first' # long format, git status
alias la='eza --icons -lgha --group-directories-first' # all files, long format, git status
alias ll='eza --icons -lgh --group-directories-first' # same as l
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
# Use apt-fast for package management
alias apt="apt-fast"
alias pkg="apt-fast"
alias update='pkg update && pkg upgrade'

# ------------------------------------------------------------------------------
# UTILITIES
# ------------------------------------------------------------------------------
alias c='clear'
alias x='exit'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'

# ------------------------------------------------------------------------------
# VISUALS
# ------------------------------------------------------------------------------
# Replace ls with eza
alias ls='eza --icons'
alias lt='eza --icons --tree' # tree view
alias lta='eza --icons --tree -lgha' # tree view, all files, long format

# Replace cat with bat
alias cat='bat --theme=OneHalfDark'

# Theme switchers
alias chcolor='~/.dotfiles/scripts/theme_switchers/colorscheme/colors.sh'
alias chfont='~/.dotfiles/scripts/theme_switchers/fonts/fonts.sh'
alias chzsh='~/.dotfiles/scripts/theme_switchers/zsh/changetheme.sh'

# Custom fetch scripts
alias rxfetch='~/.local/bin/rxfetch'

# ------------------------------------------------------------------------------
# COLOR TOYS
# ------------------------------------------------------------------------------
alias 256colors2='~/.local/bin/256colors2.pl'
alias bloks='~/.local/bin/bloks'
alias colortest='~/.local/bin/colortest'
alias colortest-slim='~/.local/bin/colortest-slim'
alias colorview='~/.local/bin/colorview'
alias colorbars='~/.local/bin/colorbars'
alias panes='~/.local/bin/panes'
alias pipes1='~/.local/bin/pipes1'
alias pipes2='~/.local/bin/pipes2'
alias pipes2-slim='~/.local/bin/pipes2-slim'
alias dna='~/.local/bin/dna'
alias ghost='~/.local/bin/ghost'
alias jfetch='~/.local/bin/jfetch'
alias pacman='~/.local/bin/pacman'
alias pipesx='~/.local/bin/pipesx'
alias rains='~/.local/bin/rains'
alias spacey='~/.local/bin/spacey'
