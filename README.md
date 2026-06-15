# Dotfiles

Stow-managed macOS dotfiles.

## Install

Install GNU Stow:

```sh
brew install stow
```

Clone the repo to `~/dotfiles`:

```sh
git clone git@github.com:Vetleh/configs.git ~/dotfiles
```

Link the `configs` package into the home directory:

```sh
cd ~/dotfiles
stow -d ~/dotfiles -t ~ configs
```

## Layout

The `configs` package mirrors paths from the home directory:

```text
configs/
  .zshrc
  .zprofile
  .config/
    borders/
    kitty/
    nvim/
    skhd/
    yabai/
```

To add a new file, place it under `configs/` using the same path it should have from `~`, then run Stow again.

## Restore

This migration created a local backup at:

```text
~/.dotfiles-bootstrap-backup/2026-06-15-stow-migration
```
