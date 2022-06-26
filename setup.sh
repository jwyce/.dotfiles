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

echo "📦 Installing brew formulae and casks"
cp Brewfile ~
brew bundle
path+=/Applications/flameshot.app//Contents/MacOS/ # gross 🤢
zsh

echo "🐢 Installing node and package managers"
fnm install 16
fnm use 16
npm i -g yarn pnpm zx typescript-language-server

echo "🔌 Setting up vim.plug and .tmux"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cp .tmux.conf ~

echo "🦀 Installing rust and cargo"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
path+=~/.cargo/bin
zsh
cargo install cargo-edit

cat doc.txt | lolcat
echo "🎉 Done!"

