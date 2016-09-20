#!/bin/bash
if [[ -z $DOTFILES_HOME ]]; then
  export DOTFILES_HOME=~/.dotfiles
fi

# vim
[[ -d ~/.vim ]] || ln -s $DOTFILES_HOME/vim ~/.vim
[[ -f ~/var/vim/backup ]] || mkdir -p ~/var/vim/backup
[[ -f ~/var/vim/swap ]] || mkdir -p ~/var/vim/swap
[[ -f ~/var/vim/undo ]] || mkdir -p ~/var/vim/undo

# git
git config --global user.name "mshr-h"
git config --global user.email "mshr-h@users.noreply.github.com"
git config --global core.editor "vim"
git config --global push.default "simple"

# tmux
[[ -f ~/.tmux.conf ]] || ln -s $DOTFILES_HOME/tmux.conf ~/.tmux.conf

# zsh
[[ -f ~/.zshrc ]] || ln -s $DOTFILES_HOME/zshrc ~/.zshrc

## install zplug
curl -sL zplug.sh/installer | zsh

