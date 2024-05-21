# dotfiles

My personal collection of dotfiles

## Homebrew

[Homebrew](https://brew.sh/) is used to install various formulae and casks.

```sh
brew bundle dump --force # Dump all formulae and casks into a file
brew bundle install # To install all formulae and casks
```

## Stow

[Stow](https://www.gnu.org/software/stow/) is used to symlink all files in the repo to the home directory.

```sh
stow --adopt .
```
