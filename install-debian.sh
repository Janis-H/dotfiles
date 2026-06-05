#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Packages ---
PACKAGES=(
    # window tiling manager
    i3

    # improved "find"
    fd-find

    # terminal
    ghostty

    # version control
    git

    # json formatter
    jq

    # standalone compositor for x11 (i3)
    picom

    # improved "grep"
    ripgrep

    # application launcher
    rofi

    # file / content search
    silversearcher-ag

    # symlink manager
    stow

    # terminal file manager
    yazi

    # enhanced version of bash
    zsh 
)

STOW_CONFIGS=(
	i3 bat lazygit nvim picom zsh
)

# --- Helper Functions ---
function is_installed() {
    dpkg -s "$1" &>/dev/null
}

function is_command_available(){
    command -v "$1" &>/dev/null
}

function install_apt_packages() {
    local to_install=()
    local pkg

    # for each argument
    for pkg in "$@"; do
        # check if package installed
        if is_installed "$pkg"; then
            echo -e "$pkg already installed"
        #else add package to install array
        else
            to_install+=("$pkg")
        fi
    done

    # if number of to_install is greater than 0
    if [[ ${#to_install[@]} -gt 0  ]]; then
        # notify user about each package being installed
        echo -e "Installing: ${to_install[*]}"
    
        # install all packages in to_install array
        sudo apt-get install -y "${to_install[@]}"
    fi
}

function stow_configs() {
	local pkg
	# cd to dotfiles directory
	cd "$DOTFILES_DIR" || return 1
	# attempt to stow each argument; else, notify the user
	for pkg in "$@"; do
		if [[ -d "$pkg" ]]; then
			echo -e "Stowing: $pkg"
			stow -R "$pkg" 2>/dev/null
		else
			echo -e "Package directory not found: $pkg"
		fi
	done
}

function install_fzf() {
    # check if installed
    if is_command_available fzf; then
        echo "fzf already installed"
        return
    fi

    # clone fzf github repo
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    # run install script
    ~/.fzf/install
}

function install_lazygit() {
    # check if installed
    if is_command_available lazygit; then
        echo "lazygit already installed"
        return
    fi

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

function install_neovim() {
    # check if installed
    if is_command_available nvim; then
        echo "nvim already installed"
        return
    fi

    # download neovim tarball
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    # remove any existing installation
    sudo rm -rf /opt/nvim-linux-x86_64

    # extract the downloaded archive
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
}

function install_zoxide() {
    # check if installed
    if is_command_available zoxide; then
        echo "zoxide already installed"
        return
    fi

    # download install script and run
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
}

function install_oh_my_zsh() {
    if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
        echo "Oh My Zsh is installed"
        return
    fi

    # intsall oh-my-zsh via curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# --- Install packages ---
install_apt_packages "${PACKAGES[@]}"

# --- Install non-apt packages ---
install_fzf
install_lazygit
install_oh_my_zsh
install_neovim
install_zoxide

# --- Stow config files ---
stow_configs "${STOW_CONFIGS[@]}"
