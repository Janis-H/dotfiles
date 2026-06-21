ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Environment variables and PATH setup
source "$ZSH_CONFIG_DIR/env.zsh"

# Shell aliases
source "$ZSH_CONFIG_DIR/aliases.zsh"

# Shell keybindings
source "$ZSH_CONFIG_DIR/keybindings.zsh"

#############################################
# Optional / commented settings (reference only)
#############################################

# zstyle ':omz:update' mode auto
# zstyle ':omz:update' frequency 13

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# DISABLE_AUTO_TITLE="true"

#############################################
# Plugins
#############################################

PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# oh-my-posh shell themes
if command -v oh-my-posh >/dev/null 2>&1; then
    # themes
    catppuccin_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/catppuccin.omp.json"
    gruvbox_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/gruvbox.omp.json"
    material_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/material.omp.json"
    pararussel_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/pararussel.omp.json"
    pure_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/pure.omp.json"
    robbyrussel_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/robbyrussell.omp.json"

    # apply theme
    eval "$(oh-my-posh init zsh --config "$material_theme")"
fi

# Source other plugins
source "$PLUGINS_DIR/zsh-autosuggestions"
source "$PLUGINS_DIR/zsh-syntax-highlighting"

# TODO: Transitioning to custom .zshrc file.
#       Remove the oh-my-zsh sections above when finished
#       moving over plugins.

HIST_STAMPS="yyyy-mm-dd"
