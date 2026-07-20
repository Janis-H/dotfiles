ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Environment variables and PATH
source "$ZSH_CONFIG_DIR/env.zsh"

# Shell options
source "$ZSH_CONFIG_DIR/options.zsh"

# Completion setup
source "$ZSH_CONFIG_DIR/completion.zsh"

# Antidote-managed plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# Load external tool integrations
source "$ZSH_CONFIG_DIR/integrations.zsh"

# Load aliases
source "$ZSH_CONFIG_DIR/aliases.zsh"

# Apply custom keybindings
source "$ZSH_CONFIG_DIR/keybindings.zsh"

# oh-my-posh prompt
source "$ZSH_CONFIG_DIR/prompt.zsh"
