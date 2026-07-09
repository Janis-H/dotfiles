#!/usr/bin/env bash
# Defines Debian-family package installtion logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing debian.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- APT helpers ---
is_installed() {
    dpkg -s "$1" &>/dev/null
}

# --- Public entrypoint ---
install_system_packages() {
    local to_install=()
    local pkg

    for pkg in "$@"; do
        if is_installed "$pkg"; then
            info "$pkg already installed"
            continue
        fi

        to_install+=("$pkg")
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing: ${to_install[*]}"

        run_cmd sudo apt-get install -y "${to_install[@]}"
    fi
}
