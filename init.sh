#!/usr/bin/env bash

# Ask for the admin password upfront
sudo -v

# Install Homebrew
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Copy dotfiles and config files to home folder
stow --adopt .
