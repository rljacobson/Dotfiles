#!/usr/bin/env bash

# Link the dot files in `~/.config/yadm/dotfiles` to `~/`.

DOTFILES_ROOT="$HOME/.config/yadm/dotfiles"

rm -f $HOME/.bash_profile
ln -s $DOTFILES_ROOT/.bash_profile $HOME/.bash_profile

rm -f $HOME/.zshrc
ln -s $DOTFILES_ROOT/.zshrc $HOME/.zshrc

# Not strictly necessary, because bootstrap has already used the Brewfile. We might wish to symlink it just to make it
# easier to edit whenever we want to add a package.
# rm -f $HOME/.Brewfile
# ln -s $DOTFILES_ROOT/.Brewfile $HOME/.Brewfile

rm -f $HOME/.clang-format
ln -s $DOTFILES_ROOT/.clang-format $HOME/.clang-format

rm -f $HOME/.condarc
ln -s $DOTFILES_ROOT/.condarc $HOME/.condarc

rm -f $HOME/.gitattributes
ln -s $DOTFILES_ROOT/.gitattributes $HOME/.gitattributes

rm -f $HOME/.gitconfig
ln -s $DOTFILES_ROOT/.gitconfig $HOME/.gitconfig

rm -f $HOME/.gitignore_global
ln -s $DOTFILES_ROOT/.gitignore_global $HOME/.gitignore_global

rm -f $HOME/.hgignore_global
ln -s $DOTFILES_ROOT/.hgignore_global $HOME/.hgignore_global

rm -f $HOME/.hosts
ln -s $DOTFILES_ROOT/.hosts $HOME/.hosts

rm -f $HOME/.stCommitMsg
ln -s $DOTFILES_ROOT/.stCommitMsg $HOME/.stCommitMsg

rm -f $HOME/.tmux.conf
ln -s $DOTFILES_ROOT/.tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
rm -f $HOME/.config/nvim/vim.init
ln -s $DOTFILES_ROOT/vim.init $HOME/.config/nvim/vim.init
