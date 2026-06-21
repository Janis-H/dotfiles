# ~/.config/zsh/completion.zsh

ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

# Extra completion definitions.
if [[ -d "$ZSH_PLUGINS_DIR/zsh-completions/src" ]]; then
    fpath=("$ZSH_PLUGINS_DIR/zsh-completions/src" $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'
