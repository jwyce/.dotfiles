# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Load Antigen
source "$HOME/antigen.zsh"

# Load Antigen configurations
antigen init ~/.antigenrc

export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config
export NVIM_LUA=$DOT/nvim/lua/jwyce
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile
export BIN=$DOT/bin/scripts
export PATH="$BIN:$PATH"
export STARSHIP_CONFIG=$DOT/starship.toml

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(opam env --switch=4.14.1)"

# Enable vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^r' _atuin_search_widget
bindkey -s ^f "tmux-sessionizer\n"

# aliases
alias rimraf='rm -rf'
alias c='clear'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls='exa'
alias lg='lazygit'
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias yolo="git push origin master --force --no-verify"
alias f='fuck'
alias kc='kubectl'
alias xsc='pbcopy'
alias rm_dangling_links='rm -- *(-@D)'

source "$DOT/.nelnet"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
