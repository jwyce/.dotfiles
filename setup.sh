#!/usr/bin/env bash

trap "exit" INT

# https://gist.github.com/vratiu/9780109
Color_Off="\033[0m"       # Text Reset
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

function symlink() {
    ln -sf $1 $2
}

function log_start() {
    echo -e "${Blue}$1${Color_Off}"
}

function log_end() {
    echo -e "${Green}$1${Color_Off}"
}

function eval_brew() {
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(fnm env --use-on-cd)"
}

DOT=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL=$HOME/.local

mkdir -p $CONFIG

log_start "🔗 Symlinking dotfiles..."
symlink $DOT/.zshrc $HOME/.zshrc
symlink $DOT/.zprofile $HOME/.zprofile
symlink $DOT/.tmux.conf $HOME/.tmux.conf
symlink $DOT/.tmux-cht-command $HOME/.tmux-cht-command
symlink $DOT/.tmux-cht-langauges $HOME/.tmux-cht-langauges
symlink $DOT/.hyper.js $HOME/.hyper.js
symlink $DOT/.antigenrc $HOME/.antigenrc
symlink $DOT/.gitconfig $HOME/.gitconfig
symlink $DOT/bin $LOCAL
symlink .tmux/ .tmux.conf
symlink $DOT/tmux.conf $HOME/.tmux.conf
log_end "Symlinks created"

log_start "🔠 Copying Fonts..."
cp -R fonts/* $HOME/Library/Fonts
log_end "fonts copied"

log_start "🍺 Installing Homebrew..."
if ! eval_brew; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  eval_brew

  echo -n 'export PATH=/Applications/flameshot.app//Contents/MacOS/:$PATH' >> $HOME/.zshenv # gross 🤢
  log_end 'Brew installed'
else
    log_end 'Brew detected'
fi
log_start "💎 Installing from Brewfile..."
brew bundle --file $DOT/Brewfile
fig theme poimandres
log_end "Formulae and casks installed"
echo

log_start "🦠 Setting up zsh and antigen..."
if ! test -e $HOME/antigen.zsh; then
    curl -L git.io/antigen > antigen.zsh
    log_end "zsh setup complete"
else
    log_end "antigen config detected"
fi

log_start "🦀 Installing Rust..."
if ! command -v rustc &> /dev/null; then
    rustup-init -y
    log_end "Rust installed"
else
    rustc -V
    log_end "Rust detected"
fi
echo

log_start "🐢 Installing node and package managers..."
if ! command -v node &> /dev/null; then
    fnm use 16 --install-if-missing
    npm i -g yarn pnpm
    log_end "NodeJS installed"
else
    node -v
    log_end "NodeJS detected"
fi
echo

log_start "🧙‍♂️ Configuring neovim..."
if ! test -e $CONFIG/nvim; then
    symlink $DOT/nvim $CONFIG
    log_end "nvim config setup"
else
    log_end "nvim config detected"
fi

# Install packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &> /dev/null
# Install plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &> /dev/null
log_end "packer.nvim plugins synced"
echo

cat doc.txt | lolcat
log_end "🎉 Done!"

