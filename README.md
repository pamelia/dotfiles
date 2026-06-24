# dotfiles

Personal shell, tmux, and oh-my-posh configuration.

## Setup

Run the bootstrap script from the repo:

```sh
./setup.sh
```

The script installs the current Homebrew taps, formulae, and casks, links
`~/.zshrc` and `~/.tmux.conf` back to this checkout, installs the oh-my-posh
themes, and installs a few Go tools.

Existing non-symlink `~/.zshrc` and `~/.tmux.conf` files are moved aside with a
`.backup` suffix before linking.
