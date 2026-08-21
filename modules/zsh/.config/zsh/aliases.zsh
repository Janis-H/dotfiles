alias lg=lazygit

# fdfind is debian specific
if  command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

# batcat is debian specific
if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

# colorize --help pages with batcat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# colorize grep results
alias grep='grep --color=always'
alias egrep='grep -E --color=always'
alias fgrep='grep -f --color=always'
