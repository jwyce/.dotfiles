#!/usr/bin/env bash

trap "exit" INT

# https://gist.github.com/vratiu/9780109
Color_Off="\033[0m"       # Text Reset
Blue="\033[0;34m"         # Blue
Green="\033[0;32m"        # Green

log_start() { echo -e "${Blue}$1${Color_Off}"; }
log_end() { echo -e "${Green}$1${Color_Off}"; }
eval_brew() {
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(fnm env --use-on-cd)"
}

DOT=$HOME/.dotfiles
CONFIG=$HOME/.config
LOCAL=$HOME/.local

# Symlink mappings: "source:destination"
SYMLINKS=(
    # zsh
    "$DOT/zsh/.antigenrc:$HOME/.antigenrc"
    "$DOT/zsh/.zshrc:$HOME/.zshrc"
    "$DOT/zsh/.zprofile:$HOME/.zprofile"
    # tmux
    "$DOT/.tmux/.tmux.conf:$CONFIG/tmux/tmux.conf"
    "$DOT/tmux/.tmux.conf.local:$CONFIG/tmux/tmux.conf.local"
    "$DOT/tmux/.tmux-cht-command:$HOME/.tmux-cht-command"
    "$DOT/tmux/.tmux-cht-languages:$HOME/.tmux-cht-languages"
    # git
    "$DOT/.gitconfig:$HOME/.gitconfig"
    # aerospace
    "$DOT/aerospace.toml:$HOME/.aerospace.toml"
    # claude
    "$DOT/.claude/CLAUDE.md:$HOME/.claude/CLAUDE.md"
    "$DOT/.claude/settings.json:$HOME/.claude/settings.json"
    "$DOT/.claude/commands:$HOME/.claude/commands"
    # opencode
    "$DOT/opencode/opencode.json:$CONFIG/opencode/opencode.json"
    "$DOT/opencode/oh-my-opencode.json:$CONFIG/opencode/oh-my-opencode.json"
    "$DOT/opencode/themes/tokyonight-transparent.json:$CONFIG/opencode/themes/tokyonight-transparent.json"
    "$DOT/opencode/command/supermemory-init.md:$CONFIG/opencode/command/supermemory-init.md"
    "$DOT/opencode/command/rmslop.md:$CONFIG/opencode/command/rmslop.md"
    # nvim
    "$DOT/nvim:$CONFIG/nvim"
    # ghostty
    "$DOT/ghostty:$CONFIG/ghostty"
    # scripts
    "$DOT/bin/scripts:$LOCAL/bin/scripts"
)

log_start "🔗 Symlinking dotfiles..."
for entry in "${SYMLINKS[@]}"; do
    src="${entry%%:*}"
    dest="${entry##*:}"
    mkdir -p "$(dirname "$dest")"
    if [[ -d "$src" ]]; then
        [[ -e "$dest" ]] || ln -sf "$src" "$dest"
    else
        ln -sf "$src" "$dest"
    fi
done
log_end "Symlinks created"

log_start "🔠 Copying Fonts..."
cp -R $DOT/fonts/* $HOME/Library/Fonts
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
log_end "Formulae and casks installed"
echo

log_start "🦠 Setting up zsh and antigen..."
if ! test -e $HOME/antigen.zsh; then
    curl -L git.io/antigen > antigen.zsh
    log_end "zsh setup complete"
else
    log_end "antigen config detected"
fi
echo

log_start "🦀 Installing Rust..."
if ! command -v rustc &> /dev/null; then
    rustup-init -y
    log_end "Rust installed"
else
    rustc -V
    log_end "Rust detected"
fi
echo

log_start "🐫 Installing OCaml..."
if ! command -v opam &> /dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://opam.ocaml.org/install.sh)"
    opam init -y
fi
if ! opam switch list 2>/dev/null | grep -q "5.4.0"; then
    opam switch create 5.4.0 -y
    opam install -y ocaml-lsp-server odoc ocamlformat utop core core_bench
    log_end "OCaml 5.4.0 installed"
else
    opam switch 5.4.0
    ocaml --version
    log_end "OCaml 5.4.0 detected"
fi
echo

log_start "🐢 Installing node and package managers..."
if ! command -v node &> /dev/null; then
    fnm use 22 --install-if-missing
    npm i -g pnpm @antfu/ni
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://bun.sh/install | bash)"
    log_end "NodeJS installed"
else
    node -v
    log_end "NodeJS detected"
fi
echo

cat doc.txt | lolcat
log_end "🎉 Done!"

