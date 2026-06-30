# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system:

### Git

```bash
sudo apt install git
```

### Stow

```bash
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory.

```bash
git clone git@github.com:Janis-H/dotfiles.git
cd dotfiles
```

then use the `./stow-modules` script to stow the default modules for your OS:

```bash
./stow-modules
```

## Scripts

### `install`

Installs system packages and external tools for the detected OS.

```bash
./install
```

The script detects the current system and runs the matching installer:

```text
installers/debian.sh
installers/arch.sh
installers/macos.sh
```

When a tool is not installed through the system package manager, the matching OS installer calls the relevant script under:

```text
installers/external/
```

### `stow-modules`

Stows or unstows dotfiles modules using GNU Stow.

```bash
./stow-modules
```

With no arguments, the script stows the default module set:

```text
stow-sets/common.sh
stow-sets/<detected-os>.sh
```

The script detects the current system and sources the matching OS module set:

```text
stow-sets/debian.sh
stow-sets/arch.sh
stow-sets/macos.sh
```

To stow selected modules, pass the module names directly:

```bash
./stow-modules nvim zsh tmux

```
To unstow modules, pass `-u`. 

With `-u` and no module names, the script unstows the default module set.

```bash
./stow-modules -u
```

With `-u` and module names, the script unstows only the selected modules:

```bash
./stow-modules -u nvim zsh tmux
```

The examples above cover the common workflows. To see all available flags and options, run:

```bash
./stow-modules -h
```

## Stow layout

Modules live under:

```text
modules/
```

Each folder inside `modules/` is a Stow package.

For example:

```text
modules/zsh/.zshrc
```

stows to:

```text
~/.zshrc
```

And:

```text
modules/nvim/.config/nvim/
```

stows to:

```text
~/.config/nvim/
```

The scripts use:

```bash
stow --dir "$DOTFILES_DIR/modules" --target "$HOME" <module>
```

So they do not need to `cd` into the `modules/` folder.

## Permissions

Only entry-point scripts need execute permission:

```bash
chmod +x install stow-modules
```

Files under `lib/` and `installers/` are sourced by the entry scripts and do not need execute permission.

```bash
chmod -x lib/*.sh
chmod -x installers/*.sh
chmod -x installers/external/*.sh
```

## Manual Stow commands

Stow one module manually:

```bash
stow -R --dir "$HOME/dotfiles/modules" --target "$HOME" zsh
```

Unstow one module manually:

```bash
stow -D --dir "$HOME/dotfiles/modules" --target "$HOME" zsh
```

## Conflict notes

If Stow reports conflicts, check whether the existing file or symlink was created by an older dotfiles layout.

For example, an old symlink may point to:

```text
~/dotfiles/zsh
```

while the current layout expects:

```text
~/dotfiles/modules/zsh
```

Check a symlink with:

```bash
readlink ~/.zshrc
```

Remove only old symlinks after confirming they are symlinks:

```bash
[[ -L ~/.zshrc ]] && rm ~/.zshrc
```

Then rerun:

```bash
./stow-modules
```
