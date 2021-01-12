#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Removes config files from $HOME (if it exists) and symlinks the config files from the .configuration
rm -rf $HOME/.zshrc
ln -s $HOME/.configuration/.zshrc $HOME/.zshrc
rm -rf $HOME/.screenrc
ln -s $HOME/.configuration/.screenrc $HOME/.screenrc
rm -rf $HOME/.tmux.conf
ln -s $HOME/.configuration/.tmux.conf $HOME/.tmux.conf
rm -rf $HOME/.vimrc
ln -s $HOME/.configuration/.vimrc $HOME/.vimrc

# install fzf keybindings
$(brew --prefix)/opt/fzf/install

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos