# Gforcedev's Dotfles
Dotfiles2 because I [previously](https://github.com/gforcedev/dotfiles) managed them with a git bare repo, but I now think stow is nicer
## Setup
- `git clone https://github.com/gforcedev/dotfiles2`
- `cd dotfiles2`
- `cat (all|server).txt | xargs stow`

# Required installation
 - Zsh
 - [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
 - [Starship](https://starship.rs/) as a terminal prompt
 - [Neovim](https://neovim.io/) - use the [PPA](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu) if on Ubuntu, or the appimage (same page) is a failsafe for something like centos
 - [Ripgrep](https://github.com/BurntSushi/ripgrep) as a telescope backend
 - [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
 - [Nvm](https://github.com/nvm-sh/nvm)
 - [i3-layouts](https://github.com/eliep/i3-layouts/tree/main/test) (via pip, into `~/.local/bin` otherwise i3.conf will need updating)
 - [bamblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status)
