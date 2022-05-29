#!/usr/bin/env bash

echo "🍺 Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile     eval "$(/opt/homebrew/bin/brew shellenv)"

echo "🐠 Installing fish"
brew install fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
chsh -s /opt/homebrew/bin/fish
fish
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

echo "🥥 Installing brew casks"
brew install --cask iterm2 warp hyper fig brave-browser rectangle stats alfred visual-studio-code tableplus datagrip docker notion spotify pictogram keycastr rustdesk
# brew install --cask spacedrive

echo "📦 Installing brew packages"
# rust core utils
brew install ripgrep atuin sd bat teeldear fd fzf exa fnm

# other utils
brew install git htop starship thefuck pnpm yarn tmux neovim
brew tap helix-editor/helix
brew install helix

echo "🔥 Setting up neovim and oh-my-tmux"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "🦀 Installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
set -U fish_user_paths ~/.cargo/bin $fish_user_paths

echo "🚚 Moving dotfiles"
cp .tmux.conf ~
cp .hyper.js ~
cp .vimrc ~
cp .ideavimrc ~
cp -r .config/* ~

echo "🎉 Done!"
refresh
