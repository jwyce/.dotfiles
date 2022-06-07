# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set -gx PATH /Users/wabamn/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH

fish_vi_key_bindings
fnm env --use-on-cd | source
starship init fish | source
thefuck --alias | source
atuin init fish | source

# aliases
alias conf='vim ~/.config/fish/conf.d/omf.fish'
alias home='cd ~/dev'
alias rimraf='rm -rf'
alias c='clear'
alias l='exa -la'
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'
alias yolo="git push origin master --force --no-verify"

# npm aliases
alias nci="npm ci"
alias nid="npm install --save-dev"
alias ni="npm install"
alias nr="npm run"

# pnpm aliases
alias pn="pnpm"
alias pni="pnpm install"
alias pna="pnpm add"
alias pnr="pnpm remove"
alias pnad="pnpm add -D"

# yarn aliases
alias y="yarn"
alias ya="yarn add"
alias yr="yarn remove"
alias yad="yarn add -D"

# cargo aliases
alias cr="cargo run"
alias ca="cargo add"
alias cn="cargo new"
alias ct="cargo test"

# functions
function on_exit --on-event fish_exit
    echo 'so long and thanks for all the fish 🐬'
    sleep 0.5
end
