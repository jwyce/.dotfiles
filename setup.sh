#!/usr/bin/env bash

echo "🍺 Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "🐠 Installing fish"
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
chsh -s /opt/homebrew/bin/fish
fish
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

echo "📦 Installing brew packages"
cp Brewfile ~
brew bundle

echo "🔥 Setting up neovim plugins and oh-my-tmux"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "🦀 Installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
set -U fish_user_paths ~/.cargo/bin $fish_user_paths

echo "🚚 Moving dotfiles"
cp .tmux.conf .tmux-cht-command .tmux-cht-langauges .hyper.js .vimrc .ideavimrc .gitconfig ~
cp -R .config/* ~

echo "🎉 Done!"
refresh
