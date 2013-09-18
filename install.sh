#/usr/bin/env bash
#
# install.sh
# Install script for dotfiles
#

cur_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
home_path="$(eval echo ~${SUDO_USER})"

# Install and configure submodules
git submodule init
git submodule update

# Remove existing vim files
rm -f "${home_path}"/.vimrc
rm -rf "${home_path}"/.vim

# Install new files from dotfiles
ln -s "${cur_path}"/vim "${home_path}"/.vim
ln -s "${cur_path}"/vimrc "${home_path}"/.vimrc

exit 0

