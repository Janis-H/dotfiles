#!/usr/bin/env bash
# shellcheck disable=SC1090

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/post-install-runner.sh}"

source "$DOTFILES_DIR/lib/log.sh"

# --- Loaders ---
load_common_post_install() {
    local common_file="$DOTFILES_DIR/installers/post-install/common.sh"

    if [[ ! -f "$common_file" ]]; then
        error "Missing common post-install file"
        return 1
    fi

    source "$common_file"
}

load_common_linux_post_install() {
    local os="$1"
    local common_linux_file="$DOTFILES_DIR/installers/post-install/common-linux.sh"

    if ! is_supported_linux_os "$os"; then
        run_common_linux_post_install() { :; }
        return 0
    fi

    if [[ ! -f "$common_linux_file" ]]; then
        error "Missing common Linux post-install file"
        return 1
    fi

    source "$common_linux_file"
}

load_os_post_install() {
    local os="$1"
    local post_install_file="$DOTFILES_DIR/installers/post-install/$os.sh"

    if [[ ! -f "$post_install_file" ]]; then
        warn "No OS-specific post-install file found for OS: $os"
        run_os_post_install() { :; }
        return 0
    fi

    source "$post_install_file"
}

load_post_installers() {
    local os="$1"

    load_common_post_install || return 1
    load_common_linux_post_install "$os" || return 1
    load_os_post_install "$os" || return 1
}

# --- Validation ---
validate_post_installers() {
    local function_name

    for function_name in \
        run_common_post_install \
        run_common_linux_post_install \
        run_os_post_install; do

        if ! declare -F "$function_name" >/dev/null; then
            error "Missing post-install function: $function_name"
            return 1
        fi
    done
}

# --- Public entrypoint ---
run_post_install() {
    local os="$1"

    load_post_installers "$os" || return 1
    validate_post_installers || return 1

    section "Post Install"

    run_common_post_install
    run_common_linux_post_install
    run_os_post_install
}
