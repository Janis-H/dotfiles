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
