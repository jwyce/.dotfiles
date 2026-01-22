# .dotfiles

Dotfiles for macOS with GNU Stow, XDG-compliant paths, and a `dot` CLI.

## Quick Install

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jwyce/.dotfiles/HEAD/install.sh)"
```

### Options
```bash
--skip-font    # Skip font installation
--skip-ssh     # Skip SSH key generation
```

## `dot` CLI

| Command | Description |
|---------|-------------|
| `dot init` | Full setup (brew, stow, languages, etc.) |
| `dot update` | Pull latest + brew upgrade + restow |
| `dot doctor` | Run health checks |
| `dot stow` | Re-symlink dotfiles only |
| `dot brew` | Install from Brewfile |
| `dot edit` | Open dotfiles in nvim |

## Structure

```
~/.dotfiles/
├── dot                 # CLI script
├── home/               # Symlinked to ~ via GNU Stow
│   ├── .config/
│   │   ├── zsh/        # Shell config
│   │   ├── nvim/       # Neovim config
│   │   ├── git/        # Git config
│   │   ├── tmux/       # Tmux config
│   │   └── ...
│   └── .local/bin/     # Scripts
├── packages/Brewfile   # Homebrew packages
├── .tmux/              # gpakosz/tmux submodule
└── fonts/              # Custom fonts
```

## How Stow Works

Files in `home/` mirror the home directory:
- `home/.config/nvim/` → `~/.config/nvim/`
- `home/.config/aerospace/` → `~/.config/aerospace/`

Run `dot stow` to re-create symlinks after changes.

## XDG Paths

| Tool | Config Location |
|------|-----------------|
| zsh | `~/.config/zsh/` (via ZDOTDIR) |
| git | `~/.config/git/config` |
| nvim | `~/.config/nvim/` |
| aerospace | `~/.config/aerospace/aerospace.toml` |
| starship | `~/.config/starship.toml` |
| ripgrep | `~/.config/ripgrep/config` |
