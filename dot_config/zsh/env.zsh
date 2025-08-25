# ~/.config/zsh/env.zsh
#
# Add your custom environment variables in this file.
#
# For example:
# export MY_VARIABLE="some_value"

# Add Go binary path to PATH
if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi
