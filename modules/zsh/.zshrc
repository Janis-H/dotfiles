ZSH_CONFIG_DIR="$HOME/.config/zsh"

# PATH, editor, and environment variables
source "$ZSH_CONFIG_DIR/env.zsh"

# zsh options and history behavior
source "$ZSH_CONFIG_DIR/options.zsh"

# completion setup
source "$ZSH_CONFIG_DIR/completion.zsh"

# antidote-managed plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# External tool integrations
source "$ZSH_CONFIG_DIR/integrations.zsh"

# aliases and command shortcuts
source "$ZSH_CONFIG_DIR/aliases.zsh"

# custom keybindings
source "$ZSH_CONFIG_DIR/keybindings.zsh"

# oh-my-posh prompt
source "$ZSH_CONFIG_DIR/prompt.zsh"
