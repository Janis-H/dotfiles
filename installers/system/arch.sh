#!/usr/bin/env bash
# Defines Arch-family package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/arch.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Pacman helpers ---
is_installed() {
    pacman -Qi "$1" &>/dev/null
}

# --- Public entrypoint ---
install_system_packages() {
    local to_install=()
    local pkg

    for pkg in "$@"; do
        if is_installed "$pkg"; then
            info "$pkg already installed"
        else
            to_install+=("$pkg")
        fi
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing: ${to_install[*]}"

        run_cmd sudo pacman -Sy --needed "${to_install[@]}"
    fi
}
