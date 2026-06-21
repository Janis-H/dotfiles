#############################################
# PATH (put early so everything can use it)
#############################################
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.fzf/bin"
    "/opt/nvim-linux-x86_64/bin"
    "/usr/local/bin"
    $path
)

export PATH

#############################################
# Environment variables
#############################################

#Oh My Posh themes
export POSH_THEMES_PATH="$HOME/.config/ohmyposh/themes"

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
