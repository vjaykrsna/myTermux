# ------------------------------------------------------------------------------
# ENVIRONMENT & PATHS
# ------------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
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
zinit light Aloxaf/fzf-tab

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
# SOURCE CUSTOM FILES
# ------------------------------------------------------------------------------
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.functions ]; then
    source ~/.functions
fi

if [ -f ~/.exports ]; then
    source ~/.exports
fi

if [ -f ~/.extra ]; then
    source ~/.extra
fi

autoload -U add-zsh-hook

# Source the autostart file
if [ -f ~/.autostart ]; then
    source ~/.autostart
fi
