@echo off
REM  vim
copy vim\\load.vimrc ..\\.vimrc
copy vim\\load.gvimrc ..\\.gvimrc
mklink /J ..\\.vim vim

REM  git
git config --global core.editor "vim"
git config --global push.default "simple"

