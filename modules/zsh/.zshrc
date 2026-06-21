ZSH_CONFIG_DIR="$HOME/.config/zsh"

# PATH, editor, and env variables
source "$ZSH_CONFIG_DIR/env.zsh"

# zsh options and history behavior
source "$ZSH_CONFIG_DIR/options.zsh"

# aliases and command shortcuts
source "$ZSH_CONFIG_DIR/aliases.zsh"

# shell keybindings
source "$ZSH_CONFIG_DIR/keybindings.zsh"

# oh-my-posh prompt
source "$ZSH_CONFIG_DIR/prompt.zsh"

#############################################
# Plugins
#############################################

PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source other plugins
source "$PLUGINS_DIR/zsh-autosuggestions"
source "$PLUGINS_DIR/zsh-syntax-highlighting"
