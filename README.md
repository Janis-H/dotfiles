# My dotfiles

This directory contains the dofiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```bash
sudo apt install git
```

### Stow

```bash
sudo apt install stow
```

## installation

First, check out the dotfiles repo in your $HOME directory 

```bash
git clone git@github.com:Janis-H/dotfiles.git
cd dotfiles
```

then use the `./stow-default.sh` script to stow the default modules for your OS

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

External installs that are not handled by the system package manager are kept under:

```text
installers/external/
```

### `stow-default`

Stows the default OS-specific set of dotfile modules into `$HOME`.

```bash
./stow-default
```

The default module lists are defined in:

```text
lib/stow-modules.sh
```

Example module groups:

```bash
COMMON_MODULES=(...)
DEBIAN_MODULES=(...)
ARCH_MODULES=(...)
MACOS_MODULES=(...)
```

### `stow-selected`

Stows only the modules passed as command-line arguments.

```bash
./stow-selected zsh nvim bat
```

Use this when adding or testing a specific module without editing `stow-default`.

### `unstow-default`

Unstows the default OS-specific set of dotfile modules from `$HOME`.

```bash
./unstow-default
```

### `unstow-selected`

Unstows only the modules passed as command-line arguments.

```bash
./unstow-selected zsh nvim bat
```

Use this when removing or testing a specific module without unstowing the full default set.

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
chmod +x install stow-default stow-selected unstow-default unstow-selected
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
./stow-default
```
