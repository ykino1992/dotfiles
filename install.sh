#!/bin/sh
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
git config --global core.excludesfile ~/.gitignore
git config --global core.editor vim
ln -sf ~/dotfiles/.gitignore ~/.gitignore
