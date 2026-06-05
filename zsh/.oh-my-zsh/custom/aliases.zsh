alias bat=batcat 
alias vim=nvim
alias lg=lazygit

# colorize --help pages with batcat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
