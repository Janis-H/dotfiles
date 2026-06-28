#############################################
# Plugins
#############################################

ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
source <(fzf --zsh)

# fzf-tab, loaded after compinit and before autosuggestions/syntax-highlighting
source "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"

# autosuggestions
source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# syntax highlighting must be sourced last
source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# cycle through matches of command history
# zsh-history-substring must be sourced after syntax-highlighting
source "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
