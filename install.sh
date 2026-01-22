#!/usr/bin/env bash

set -e

REPO_URL=https://github.com/jwyce/.dotfiles.git
INSTALL_PATH=$HOME/.dotfiles

xcode-select --install 2>/dev/null || true

if ! command -v brew >/dev/null 2>&1; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ "$(uname -m)" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

brew install git stow

if [[ ! -d "$INSTALL_PATH" ]]; then
    git clone "$REPO_URL" "$INSTALL_PATH" --recurse-submodules
fi

"$INSTALL_PATH/dot" init "$@"
