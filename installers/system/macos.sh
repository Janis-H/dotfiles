#!/usr/bin/env bash
# Defines macOS package installation logic

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/macos.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Homebrew helpers ---
is_formula_installed() {
    brew list --formula "$1" &>/dev/null
}

is_cask_installed() {
    brew list --cask "$1" &>/dev/null
}

# --- OS prerequisites ---
ensure_xcode_tools() {
    if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables >/dev/null 2>&1; then
        info "Xcode Command Line Tools already installed"
        return
    fi

    info "Installing Xcode Command Line Tools"
    run_cmd xcode-select --install

    info "Finish the macOS install prompt, then rerun this script"
    run_cmd exit 1
}

ensure_homebrew() {
    install_url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

    if command -v brew &>/dev/null; then
        info "Homebrew already installed"
        return
    fi

    info "Installing Homebrew"

    # NOTE:
    # Do not use run_cmd here
    # Dry-run is checked before command substitution so curl does not run during dry-run.
    if [[ "${DRY_RUN:-false}" == true ]]; then
        # shellcheck disable=SC2016
         printf '+ /bin/bash -c "$(curl -fsSL %q)"\n' "$install_url"
    fi

    /bin/bash -c "$(curl -fsSL "$install_url")"
}

install_os_prerequisites() {
    ensure_xcode_tools
    ensure_homebrew
}

# --- Install Steps ---
install_brew_packages() {
    local to_install=()
    local pkg

    for pkg in "$@"; do
        if is_formula_installed "$pkg"; then
            info "$pkg already installed"
        else
            to_install+=("$pkg")
        fi
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing packages: ${to_install[*]}"

        run_cmd brew install "${to_install[@]}"
    fi
}

install_brew_casks() {
    local to_install=()
    local cask

    for cask in "$@"; do
        if is_cask_installed "$cask"; then
            info "$cask already installed"
        else
            to_install+=("$cask")
        fi
    done

    if [[ ${#to_install[@]} -gt 0  ]]; then
        info "Installing casks: ${to_install[*]}"

        run_cmd brew install --cask "${to_install[@]}"
    fi
}

# --- Public entrypoint ---
install_system_packages() {
    install_os_prerequisites
    install_brew_packages "$@"
}

install_system_casks() {
    install_brew_casks "$@"
}
