#! /bin/bash

echo "Creating backup copies of old dotfiles, if any"
cp ~/.zshrc ~/.zshrc.bak
cp ~/.vimrc ~/.vimrc.bak
cp ~/.vim ~/.vim.bak
cp ~/.gitconfig ~/.gitconfig.bak
cp ~/.gitignore_global ~/.gitignore_global.bak

echo "Creating symlinks"
ln -fs ~/dotfiles/zsh/.zshrc ~
ln -fs ~/dotfiles/vim/.vimrc ~
ln -fs ~/dotfiles/vim/.vim ~
mkdir ~/dotfiles/vim/.vim/swap
mkdir ~/dotfiles/vim/.vim/backup
ln -fs ~/dotfiles/git/.gitconfig ~
ln -fs ~/dotfiles/git/.gitignore_global ~
ln -fs ~/dotfiles/zsh/leo.zsh-theme ~/.oh-my-zsh/themes/
