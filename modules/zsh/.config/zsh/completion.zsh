# ~/.config/zsh/completion.zsh

# Manual plugin fallback
# Currently unused because Zsh plugins are managed by Antidote
# ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

# # Extra completion definitions.
# if [[ -d "$ZSH_PLUGINS_DIR/zsh-completions/src" ]]; then
#     fpath=("$ZSH_PLUGINS_DIR/zsh-completions/src" $fpath)
# fi

ZSH_COMPLETIONS_DIR="$HOME/.cache/antidote/github.com/zsh-users/zsh-completions/src"

# Add Antidote-managed completion definitions before compinit
if [[ -d "$ZSH_COMPLETIONS_DIR" ]]; then
    fpath=("$ZSH_COMPLETIONS_DIR" $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
