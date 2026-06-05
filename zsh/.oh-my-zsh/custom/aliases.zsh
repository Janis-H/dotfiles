# dev paths
export DEV="$HOME/dev"
export PROJECTS="$DEV/projects"
export COURSEWORK="$DEV/projects/coursework"
export SCRIPTS="$DEV/scripts"
export SCRIPT_BIN="$DEV/scripts/bin"
export SCRIPT_LIB="$DEV/scripts/lib"
export SCRIPT_PROJECTS="$DEV/scripts/projects"
export TOOLS="$DEV/tools"
export REPOS="$DEV/repos"
export NOTES="$DEV/notes"
export DOTFILES="$HOME/dotfiles"

# dev navigation
alias cdev='cd "$DEV"'
alias cproj='cd "$PROJECTS"'
alias ccourse='cd "$COURSEWORK"'
alias cscripts='cd "$SCRIPTS"'
alias csbin='cd "$SCRIPT_BIN"'
alias cslib='cd "$SCRIPT_LIB"'
alias csproj='cd "$SCRIPT_PROJECTS"'
alias ctools='cd "$TOOLS"'
alias crepos='cd "$REPOS"'
alias cnotes='cd "$NOTES"'
alias cdot='cd "$DOTFILES"'

# config file paths
export DOTFILES_DIR="$HOME/dotfiles"

export I3_DIR="$DOTFILES_DIR/i3/.config/i3"
export NVIM_DIR="$DOTFILES_DIR/nvim/.config/nvim"
export ZSH_DIR="$DOTFILES_DIR/zsh"

export I3_CONFIG="$I3_DIR/config"
export NVIM_CONFIG="$NVIM_DIR/init.lua"
export ZSH_CONFIG="$ZSH_DIR/.zshrc"
export ZSH_ALIASES_CONFIG="$ZSH_DIR/zsh/aliases.zsh"

# nvim config edits
alias ni3config='nvim "$I3_CONFIG"'
alias nvimrc='nvim "$NVIM_CONFIG"'
alias nzsh='nvim "$ZSH_CONFIG"'
alias nzsha='nvim "$ZSH_ALIASES_CONFIG"'

# program shortcuts
alias bat=batcat 
alias vim=nvim
alias lg=lazygit

# colorize man pages with batcat
export MANPAGER='sh -c "col -bx | batcat -l man -p"'
export MANROFFOPT="-c"

# colorize --help pages with batcat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# PATH
export PATH="$PATH:$SCRIPT_BIN"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
