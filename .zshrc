# ------------------------------------------------------------------------------
# ENVIRONMENT & PATHS
# ------------------------------------------------------------------------------
export EDITOR="micro"
export VISUAL="micro"

# ------------------------------------------------------------------------------
# SHELL OPTIONS
# ------------------------------------------------------------------------------
setopt histignorealldups sharehistory

# ------------------------------------------------------------------------------
# COMPLETION STYLING (MUST be before plugins)
# ------------------------------------------------------------------------------
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# ------------------------------------------------------------------------------
# ZINIT - PLUGIN MANAGER
# ------------------------------------------------------------------------------
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Syntax Highlighting (asynchronous)
zinit ice lucid wait'0'
zinit light zdharma-continuum/fast-syntax-highlighting

# Completions (synchronous, to be safe)
zinit ice lucid atinit'zpcompinit; zpcdreplay'
zinit light zsh-users/zsh-completions

# Autosuggestions (synchronous, to be safe)
zinit light zsh-users/zsh-autosuggestions

# FZF and fzf-tab (asynchronous)
zinit ice lucid wait'0'
zinit light junegunn/fzf

# Other plugins
zinit ice lucid; zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice lucid; zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# FZF
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# PROMPT
eval "$(dircolors -b)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# ------------------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------------------
# General
alias cls='clear'
alias ls='exa'
alias ll='exa -alh --icons'
alias la='exa -a'
alias cd='z'
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias editzsh="micro ~/.zshrc"
alias reloadzsh="source ~/.zshrc"

# System & Monitoring
alias mem='free -h'
alias cpu='btop'
alias temp='sensors'
alias usage='du -sh * 2>/dev/null | sort -hr'
alias update='apt update && apt upgrade -y'
alias cleanup='sudo apt autoremove --purge -y && sudo apt clean'
alias netcheck='ping -c 4 google.com'
alias ports='sudo lsof -i -P -n | grep LISTEN'

# ------------------------------------------------------------------------------
# FUNCTIONS
# ------------------------------------------------------------------------------

extract () {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "Don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

autoload -U add-zsh-hook
