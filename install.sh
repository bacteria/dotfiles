#/bin/bash
#
# install.sh
# Install script for dotfiles
# 28 April, 2013
#

cd ~

# Remove existing vim files
rm -rf ~/.vimrc ~/.vim

# Install new files from dotfiles
ln -s dotfiles/vim .vim
ln -s dotfiles/vim/vimrc .vimrc

# Install and configure submodules
cd dotfiles
git submodule init
git submodule update


exit 0

