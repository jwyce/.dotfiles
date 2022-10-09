#!/usr/bin/env bash

echo "🍺 Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "🚚 Moving dotfiles"
cp .tmux-cht-command .tmux-cht-langauges .hyper.js .gitconfig .zshrc .antigenrc ~
cp -R .config/* ~/.config
cp -R .local/* ~/.local
cp -R fonts/* ~/Library/Fonts

echo "🦠 Setting up zsh and antigen"
curl -L git.io/antigen > antigen.zsh
zsh

echo "💎 Installing from Brewfile"
cp Brewfile ~
brew bundle
echo -n 'export PATH=/Applications/flameshot.app//Contents/MacOS/:$PATH' >> ~/.zshenv # gross 🤢
zsh

fig theme poimandres

echo "🐢 Installing node and package managers"
fnm install 16
fnm use 16
npm i -g yarn pnpm zx typescript-language-server

echo "📦 Setting up packer and .tmux"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp .tmux.conf ~

echo "🦀 Installing rust and cargo"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
echo -n 'export PATH=~/.cargo/bin:$PATH' >> ~/.zshenv
zsh
cargo install cargo-edit


cat doc.txt | lolcat
echo "🎉 Done!"

