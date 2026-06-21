#############################################
# Plugins
#############################################

ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
source <(fzf --zsh)

# fzf-tab, loaded after compinit and before autosuggestions/syntax-highlighting
source "$ZSH_PLUGINS_DIR/fzf-tab"

# autosuggestions
source "$ZSH_PLUGINS_DIR/zsh-autosuggestions"

# syntax highlighting must be sourced last
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting"
