# My dotfiles

This directory contains the dofiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo apt install git
```

### Stow

```
sudo apt install stow
```

## installation

First, check out the dotfiles repo in your $HOME directory 

```
git clone git@github.com:Janis-H/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks
```
stow .
```
