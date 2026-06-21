# oh-my-posh prompt
if command -v oh-my-posh >/dev/null 2>&1; then
    # themes
    catppuccin_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/catppuccin.omp.json"
    gruvbox_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/gruvbox.omp.json"
    material_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/material.omp.json"
    pararussel_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/pararussel.omp.json"
    pure_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/pure.omp.json"
    robbyrussel_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/robbyrussell.omp.json"

    # apply theme
    eval "$(oh-my-posh init zsh --config "$material_theme")"
fi
