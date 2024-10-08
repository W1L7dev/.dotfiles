# W1l7dev's Dotfiles

Here are my dotfiles. They are made for Arch Linux, but they could work with almost any system.

I recommend installing `stow`, as it's an easy way of managing dotfiles.

Here's a link to the `stow` website: [https://www.gnu.org/software/stow/](https://www.gnu.org/software/stow/)

## Requirements

Pacman

```bash
sudo pacman -S alacritty bat btop dust hyprland kitty neofetch neovim waybar wofi nautilus git stow zsh tmux bat eza fd zoxide thefuck flatpak
```

Yay

```bash
yay -S cava
```

Flatpak

```bash
flatpak install com.google.Chrome
```

Git Repos

```bash
git clone https://github.com/junegunn/fzf-git.sh
```

## Installation

```bash
git clone https://github.com/W1L7dev/.dotfiles.git $HOME/.dotfiles
cd ~/.dotfiles
stow .
```
