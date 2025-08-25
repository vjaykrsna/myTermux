# ~/.config/zsh/functions.zsh
#
# Add your custom functions in this file.
#
# Functions are more powerful than aliases. They can take arguments and perform more complex tasks.

# ------------------------------------------------------------------------------
# EXAMPLE FUNCTION
# ------------------------------------------------------------------------------
# Create a directory and change into it.
mkcd() {
    mkdir -p "$1" && cd "$1"
}
