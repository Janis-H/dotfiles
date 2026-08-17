
#!/usr/bin/env bash

: "${DOTFILES_DIR:?DOTFILES_DIR must be set before sourcing post-install/common.sh}"

# --- Sources ---
source "$DOTFILES_DIR/lib/log.sh"
source "$DOTFILES_DIR/lib/install-or-update-repo.sh"
source "$DOTFILES_DIR/lib/run-command.sh"

# --- Helpers ---
gsettings_key_exists() {
    local schema="$1"
    local key="$2"

    command -v gsettings >/dev/null 2>&1 &&
        gsettings list-schemas | grep -Fxq "$schema" &&
        gsettings list-keys "$schema" | grep -Fxq "$key"
}

check_valid_linux_os() {
    case "$OS" in
        arch | fedora | debian)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# --- Setup functions ---
setup_docker_non_root_access() {
    local target_user="${SUDO_USER:-$USER}"

    info "Configuring Docker for non-root access"

    run_cmd sudo groupadd -f docker
    run_cmd sudo usermod -aG docker "$target_user"

    info "Log out and back in for Docker group membership to take effect"
}

configure_gnome_theme() {
    local schema="org.gnome.desktop.interface"

    if ! command -v gsettings >/dev/null 2>&1 ||
       ! gsettings list-schemas | grep -Fxq "$schema"; then
        info "Skipping GNOME theme configuration"
        return 0
    fi

    info "Configuring GNOME theme"

    run_cmd gsettings set "$schema" color-scheme 'prefer-dark'
    run_cmd gsettings set "$schema" gtk-theme 'Nordic'
    run_cmd gsettings set "$schema" icon-theme 'Papirus-Dark'
    run_cmd gsettings set "$schema" cursor-theme 'Bibata-Modern-Ice'
    run_cmd gsettings set "$schema" cursor-size 28
    run_cmd gsettings set "$schema" font-name 'DejaVu Sans 12'
    run_cmd gsettings set "$schema" monospace-font-name 'FiraCode Nerd Font 13'
}

configure_browser_extensions() {
    local policies_dir="$HOME/dotfiles/modules/browsers/policies"
    local zen_policy="$policies_dir/zen.json"
    local helium_policy="$policies_dir/helium.json"
    local chrome_policy="$policies_dir/chrome.json"

    #
    # Zen Browser
    #
    if flatpak info app.zen_browser.zen &>/dev/null; then
        local zen_arch
        local zen_branch
        local zen_policy_dir

        zen_arch="$(flatpak info --show-arch app.zen_browser.zen)" ||
            return 1

        zen_branch="$(flatpak info --show-branch app.zen_browser.zen)" ||
            return 1

        zen_policy_dir="${XDG_DATA_HOME:-$HOME/.local/share}/flatpak/extension"
        zen_policy_dir+="/app.zen_browser.zen.systemconfig"
        zen_policy_dir+="/$zen_arch/$zen_branch/policies"

        if [[ -f "$zen_policy" ]]; then
            info "Installing Zen Browser extension policy..."

            run_cmd mkdir -p "$zen_policy_dir" ||
                return 1

            run_cmd install -m644 \
                "$zen_policy" \
                "$zen_policy_dir/policies.json" ||
                return 1
        else
            warn "Zen Browser policy not found: $zen_policy"
        fi
    else
        warn "Zen Browser is not installed, skipping extension policy"
    fi

    #
    # Google Chrome / Chromium
    #
    if [[ -f "$chrome_policy" ]]; then
        local chrome_policy_dir=""

        if command -v google-chrome-stable &>/dev/null ||
            command -v google-chrome &>/dev/null; then
            chrome_policy_dir="/etc/opt/chrome/policies/managed"
        elif command -v chromium &>/dev/null ||
            command -v chromium-browser &>/dev/null; then
            chrome_policy_dir="/etc/chromium/policies/managed"
        fi

        if [[ -n "$chrome_policy_dir" ]]; then
            info "Installing Chrome extension policy"

            run_cmd sudo install -Dm644 \
                "$chrome_policy" \
                "$chrome_policy_dir/extensions.json" ||
                return 1
        fi
    fi

    #
    # Helium
    #
    if command -v helium &>/dev/null; then
        if [[ -f "$helium_policy" ]]; then
            info "Installing Helium extension policy..."

            run_cmd sudo install -Dm644 \
                "$helium_policy" \
                /etc/chromium/policies/managed/helium.json ||
                return 1
        else
            warn "Helium policy not found: $helium_policy"
        fi
    else
        warn "Helium is not installed, skipping extension policy"
    fi
}

# --- Public entrypoint ---
run_common_linux_post_install() {
    check_valid_linux_os || return 0

    setup_docker_non_root_access

    configure_browser_extensions
    configure_gnome_theme
}
