#!/usr/bin/env bash

# Install Homebrew, and install everything in Homebrew.

# Prepare Homebrew location
HOMEBREW_PREFIX="/usr/local"
if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi


if ! command -v brew >/dev/null; then
  printHeading "Installing Homebrew"
  printDivider
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  printDivider
fi

if brew list | grep -Fq brew-cask; then
  printHeading "Uninstalling old Homebrew-Cask"
  printDivider
  brew uninstall --force brew-cask
  printDivider
fi

printHeading "Updating Homebrew formulae"
printDivider
brew update --force # https://github.com/Homebrew/brew/issues/1151
printDivider

printHeading "Installing Brewfile"
printDivider
brew bundle --file=dotfiles/.Brewfile
printDivider
