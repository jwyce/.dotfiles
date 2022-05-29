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
brew install --cask iterm2
brew install --cask warp
brew install --cask hyper
brew install --cask fig
brew install --cask brave-browser
brew install --cask rectangle
brew install --cask stats
brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask tableplus
brew install --cask datagrip
brew install --cask docker
brew install --cask notion
brew install --cask spotify
brew install --cask pictogram brew install --cask keycastr
brew install --cask rustdesk
# brew install --cask spacedrive

echo "📦 Installing brew packages"
# rust core utils
brew install ripgrep
brew install atuin
brew install sd
brew install bat
brew install teeldear
brew install fd
brew install fzf
brew install exa
brew install fnm

# other utils
brew install htop
brew install starship
brew install thefuck
brew install pnpm
brew install tmux
brew install neovim
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
