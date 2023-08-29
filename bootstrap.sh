#!/bin/bash
if [[ -z $DOTFILES_HOME ]]; then
  export DOTFILES_HOME=~/.dotfiles
fi

# vim
[[ -d ~/.vim ]] || ln -sfnv $DOTFILES_HOME/vim ~/.vim
[[ -f ~/var/vim/backup ]] || mkdir -p ~/var/vim/backup
[[ -f ~/var/vim/swap ]] || mkdir -p ~/var/vim/swap
[[ -f ~/var/vim/undo ]] || mkdir -p ~/var/vim/undo

# git
git config --global core.editor "vim"
git config --global push.default "simple"
git config --global ghq.root ~/src

# tmux
[[ -f ~/.tmux.conf ]] || ln -sfnv $DOTFILES_HOME/tmux.conf ~/.tmux.conf
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# wezterm
[[ -f ~/.wezterm.lua ]] || ln -sfnv $DOTFILES_HOME/wezterm.lua ~/.wezterm.lua
