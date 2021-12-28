#!/usr/bin/env bash

# oh-my-ZSH, from https://github.com/ohmyzsh/ohmyzsh#via-curl
printHeading "Installing Oh-My-ZSH"
printDivider
# This script requires git.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# The theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
printDivider
