#!/usr/bin/env bash

echo "🍺 Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "🚚 Moving dotfiles"
cp .tmux.conf .tmux-cht-command .tmux-cht-langauges .hyper.js .vimrc .ideavimrc .gitconfig .zshrc .antigenrc ~
cp -R .config/* ~/.config
cp -R .local/* ~/.local
cp -R fonts/* ~/Library/Fonts

echo "🦠 Setting up zsh and antigen"
curl -L git.io/antigen > antigen.zsh
zsh

echo "📦 Installing brew formulae and casks"
cp Brewfile ~
brew bundle

echo "🐢🧶🟧 Installing node, yarn, and pnpm"
fnm install 16
fnm use 16
brew install yarn pnpm

echo "🔥 Setting up neovim plugins and oh-my-tmux"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "🦀 Installing rust and cargo"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
export PATH=~/.cargo/bin
cargo install cargo-edit

cat doc.txt | lolcat
echo "🎉 Done!"

