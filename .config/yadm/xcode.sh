#!/usr/bin/env bash

# Install xcode cli development tools
printHeading "Installing xcode cli development tools"
printDivider
    # xcode-select --install && \
    #     read -n 1 -r -s -p $'\n\nWhen Xcode cli tools are installed, press ANY KEY to continue...\n\n' || \
    #         printDivider && echo "✔ Xcode cli tools already installed. Skipping"

    xcode-select --install || \
            printDivider && echo "✔ Xcode cli tools already installed. Skipping"
printDivider
