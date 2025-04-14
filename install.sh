#!/bin/sh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/dein ~/.config/dein
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/dotfiles/.config/git ~/.config/git
# ln -sf ~/dotfiles/com.googlecode.iterm2.plist ~/com.googlecode.iterm2.plist

git config --global core.editor vim
