ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Environment variables and PATH setup
source "$ZSH_CONFIG_DIR/env.zsh"

#############################################
# KEY-BINDINGS
#############################################

# tmux-sessionizer
# Prefix + f opens the project picker.
# Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
bindkey -s '^f' 'tmux-sessionizer\n' # <C-f>
bindkey -s '\e1' 'tmux-sessionizer -s 0\n' # Alt-1 or Option-1
bindkey -s '\e2' 'tmux-sessionizer -s 1\n' # Alt-2 or Option-2
bindkey -s '\e3' 'tmux-sessionizer -s 2\n' # Alt-3 or Option-3
bindkey -s '\e4' 'tmux-sessionizer -s 3\n' # Alt-4 or Option-4

#############################################
# Oh My Zsh setup
#############################################
# export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

# plugins=(
#   git
#   fzf
#   # zsh-autosuggestions
#   zsh-syntax-highlighting
# )

# # Load Oh My Zsh
# source "$ZSH/oh-my-zsh.sh"

#############################################
# Custom Zsh configuration
#############################################

# Custom Oh My Zsh folder (optional override)
# export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Load user aliases (keep aliases separate from env vars)
if [ -f "$ZSH_CUSTOM/aliases.zsh" ]; then
  source "$ZSH_CUSTOM/aliases.zsh"
fi


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
