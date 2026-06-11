#!/usr/bin/env bash
# Defines Debian-family external tool installs not handled by apt

# -- Helper functions ---
is_command_available(){
    command -v "$1" &>/dev/null
}

# --- External installers ---
install_fzf() {
    # check if installed
    if is_command_available fzf; then
        info "fzf already installed"
        return
    fi

    # clone fzf github repo
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    # run install script
    ~/.fzf/install
}

install_lazygit() {
    # check if installed
    if is_command_available lazygit; then
        info "lazygit already installed"
        return
    fi

    info "Installing lazygit"

    # get latest lazygit release
    LAZYGIT_VERSION=$(
        curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \
        grep -Po '"tag_name": *"v\K[^"]*'
    )
    # get cpu architecture
    LAZYGIT_ARCH=$(
        uname -m | sed -e 's/aarch64/arm64/'
    )

    # download lazygit tarball
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"

    # open lazygit tarball
    tar xf lazygit.tar.gz lazygit

    # install lazygit
    sudo install lazygit -D -t /usr/local/bin/
}

install_neovim() {
    # check if installed
    if is_command_available nvim; then
        info "nvim already installed"
        return
    fi

    info "Installing nvim"

    # download neovim tarball
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    # remove any existing installation
    sudo rm -rf /opt/nvim-linux-x86_64

    # extract the downloaded archive
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
}

install_zoxide() {
    # check if installed
    if is_command_available zoxide; then
        info "zoxide already installed"
        return
    fi

    info "Installing zoxide"

    # download install script and run
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
}

install_oh_my_zsh() {
    if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
        info "Oh My Zsh is installed"
        return
    fi

    info "Installing oh-my-zsh"

    # install oh-my-zsh via curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# --- Wrapper ---
install_external_tools() {
    # apt version updates too slowly
    install_fzf
    install_neovim

    # not available in apt
    install_lazygit
    install_oh_my_zsh
    install_zoxide
}
