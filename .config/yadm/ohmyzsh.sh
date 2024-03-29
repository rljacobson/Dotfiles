#!/usr/bin/env bash

# oh-my-ZSH, from https://github.com/ohmyzsh/ohmyzsh#via-curl
printHeading "Installing Oh-My-ZSH"
printDivider

# This script requires git.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# The theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ZSH Auto-Suggestions Plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

printf("\nYou will want to install a powerline compatible font like monofur in order for OhMyZsh to display correctly:\n")
printf("\tbrew tap homebrew/cask-fonts && brew install font-monofur-nerd-font\n")


printDivider
