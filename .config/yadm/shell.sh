#!/usr/bin/env bash

# Changes the shell to ZSH. This only affects the user's default shell.
# This script is always run under bash.

update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  printHeading "Changing your shell to zsh"
  printDivider
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    printHeading "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
  printDivider
}

case "$SHELL" in
  */zsh)
    if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
      update_shell
    fi
    ;;
  *)
    update_shell
    ;;
esac
