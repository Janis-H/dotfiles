#############################################
# KEY-BINDINGS
#############################################

# Enable vi-style ZLE keybindings
bindkey -v

# Edit the current command line in the configured editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
bindkey -M viins '^X^E' edit-command-line

# Sessionizer
# Ctrl-F opens the Herdr or tmux project picker for the current environment.
# Alt bindings run TS_SESSION_COMMANDS by index in the active project session.
bindkey -s '^f' 'sessionizer\n'            # <C-f>
bindkey -s '\e1' 'tmux-sessionizer -s 0\n' # Alt-1 or Option-1
bindkey -s '\e2' 'tmux-sessionizer -s 1\n' # Alt-2 or Option-2
bindkey -s '\e3' 'tmux-sessionizer -s 2\n' # Alt-3 or Option-3
bindkey -s '\e4' 'tmux-sessionizer -s 3\n' # Alt-4 or Option-4

# zsh-history-substring-search
#
# bind arrow keys to
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind '^P' and '^N' keys for use in EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind 'j' and 'k' keys for use in VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
