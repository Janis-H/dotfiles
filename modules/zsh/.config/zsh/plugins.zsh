#############################################
# Plugins
#############################################

PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source other plugins
source "$PLUGINS_DIR/zsh-autosuggestions"
source "$PLUGINS_DIR/zsh-syntax-highlighting"
