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
export DOT_CONFIG="$HOME/dotfiles/.config"
export I3_CONFIG="$DOT_CONFIG/i3/config"
export NVIM_CONFIG="$DOT_CONFIG/nvim/init.vim"
export ZSH_CONFIG="$DOT_CONFIG/.zshrc"
export ZSH_ALIASES_CONFIG="$ZSH_CUSTOM/aliases.zsh"

# nvim config edits
alias ni3config='nvim "$I3_CONFIG"'
alias nvimrc='nvim "$NVIM_CONFIG"'
alias nzsh='nvim "$ZSH_CONFIG"'
alias nzsha='nvim "$ZSH_ALIASES_CONFIG"'

# program shortcuts
alias bat=batcat 
alias vim=nvim

# colorize man pages with batcat
export MANPAGER='sh -c "col -bx | batcat -l man -p"'
export MANROFFOPT="-c"

# colorize --help pages with batcat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# PATH
export PATH="$PATH:$SCRIPT_BIN"
