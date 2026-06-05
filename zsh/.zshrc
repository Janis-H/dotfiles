#############################################
# PATH (put early so everything can use it)
#############################################
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Neovim (manual installation)
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

#############################################
# Oh My Zsh setup
#############################################
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"


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

# Colorize man pages with batcat
export MANPAGER='sh -c "col -bx | batcat -l man -p"'
export MANROFFOPT="-c"


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
# HIST_STAMPS="yyyy-mm-dd"
