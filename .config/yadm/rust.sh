#!/usr/bin/env bash

# Installs the Rust toolchain in unattended mode.

if command -V rustc >/dev/null; then
  printHeading "Installing Rust"
  printDivider
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    cargo install mathematica-notebook-filter
  printDivider
fi

# Installs nightly and makes it the default Rust compiler.
rustup toolchain install nightly
rustup default nightly
