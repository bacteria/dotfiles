# Dotfiles

My dotfiles. Mainly vim configuration and plugins

## Vim Plugins

### Adding a Plugin
    git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive


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

