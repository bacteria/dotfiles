# Dotfiles

My dotfiles. Mainly vim configuration and plugins


## Installation

    git clone git://github.com/bacteria/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    ./install.sh

## Vim Plugins

### Adding a Plugin
    git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive

This will update the `.gitmodules` file by appending something like:

    [submodule "vim/bundle/vim-fugitive"]
        path = vim/bundle/vim-fugitive
        url = http://github.com/xxxxxx/vim-fugitive.git
    
As well as checkout out the git repo into the `vim/bundle/vim-javascript` directory. You can then commit these changes as follows:

    git add .
    git ci -m "Added the fugitive bundle"

### Upgrading a plugin bundle
To fetch the latest changes, go into the fugitive repository, and pull the latest version:

    cd ~/dotfiles/vim/bundle/fugitive
    git pull origin master

### Upgrading all bundled plugins
You can use the foreach command to execute any shell script in from the root of all submodule directories. To update to the latest version of each plugin bundle, run the following:

    cd ~/dotfiles
    git submodule foreach git pull origin master

### References

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

