#############################################
# PATH (put early so everything can use it)
#############################################
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Neovim (manual installation)
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

#############################################
# Environment variables
#############################################

# Preferred editor (SSH-safe)
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
  export VISUAL="vim"
else
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Fzf Customization
FZF_BASE="$HOME/.fzf"
if command -v fd >/dev/null 2>&1; then
    FD_CMD="fd"
elif command -v fdfind >/dev/null 2>&1; then
    FD_CMD="fdfind"
fi

# FZF commands
export FZF_DEFAULT_COMMAND="$FD_CMD --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Colorize man pages with batcat
if command -v bat >/dev/null 2>&1; then
    BAT_CMD="bat"
elif command -v batcat >/dev/null 2>&1; then
    BAT_CMD="batcat"
fi
export MANPAGER="sh -c \"col -bx | $BAT_CMD -l man -p\""
export MANROFFOPT="-c"

#############################################
# Oh My Zsh setup
#############################################
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  fzf
  # zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

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

# PLUGINS_DIR="$HOME/.zsh/plugins"

# Enable fzf key bindings and autocompletion
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source other plugins
# source "$PLUGINS_DIR/zsh-autosuggestions"
# source "$PLUGINS_DIR/zsh-syntax-highlighting"

# TODO: Transitioning to custom .zshrc file.
#       Remove the oh-my-zsh sections above when finished
#       moving over plugins.

# HIST_STAMPS="yyyy-mm-dd"
