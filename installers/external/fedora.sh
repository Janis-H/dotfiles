#!/usr/bin/env bash
# Defines Arch-family external tool installs not handled by pacman

: "$DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/external/arch.sh"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External tool installers ---
install_external_resvg() {
    if is_command_available resvg; then
        info "resvg already installed"
        return 0
    fi

    if ! is_command_available cargo; then
        warn "Cargo is required to install resvg"
        return 1
    fi

    info "Installing resvg"
    run_cmd cargo install resvg --locked
}

install_external_proton_mail() (
    info "Installing Proton Mail"

    local download_url='https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm'
    local temp_dir
    local package_path

    temp_dir="$(mktemp -d)"
    package_path="$temp_dir/ProtonMail-desktop-beta.rpm"

    trap 'rm -rf "$temp_dir"' EXIT

    run_cmd curl -fL \
        --output "$package_path" \
        "$download_url"

    run_cmd sudo dnf install -y "$package_path"
)

install_external_proton_pass() (
    info "Installing Proton Pass"

    local download_url='https://proton.me/download/PassDesktop/linux/x64/ProtonPass.rpm'
    local temp_dir
    local package_path

    temp_dir="$(mktemp -d)"
    package_path="$temp_dir/ProtonPass.rpm"

    trap 'rm -rf "$temp_dir"' EXIT

    run_cmd curl -fL \
        --output "$package_path" \
        "$download_url"

    run_cmd sudo dnf install -y "$package_path"
)

install_external_lazydocker() {
    info "Installing or Updating lazydocker"
    run_cmd go install github.com/jesseduffield/lazydocker@latest
}

install_external_lazygit() {
    info "Installing or updating lazygit"
    run_cmd go install github.com/jesseduffield/lazygit@latest
}

# TODO: move install_external_oh_my_posh to common
install_external_oh_my_posh() {
    local install_url="https://ohmyposh.dev/install.sh"

    if is_command_available oh-my-posh; then
        info "oh-my-posh already installed"
        return 0
    fi

    info "Installing oh-my-posh"

    # NOTE:
    # Do not wrap this in run_cmd.
    # Dry run must be checked before the pipeline so curl does not run
    if [[ "${DRY_RUN:-false}" == true ]]; then
        printf '+ curl -fsSL %q | bash -s\n' "$install_url"
        return 0
    fi

    curl -fsSL "$install_url" | bash -s
}
