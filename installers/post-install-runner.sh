#!/usr/bin/env bash
# shellcheck disable=SC1090

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing installers/post-install-runner.sh}"

source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/installers/post-install/common.sh"

# --- Helpers ---
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

# --- Public entrypoint ---
run_post_install() {
    local os="$1"

    load_os_post_install "$os"

    title "Post Install"

    run_common_post_install
    run_os_post_install
}
