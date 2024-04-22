# dotfiles

My personal dotfiles.


## Installation

Download the files into your home directory
```
cd ~
git clone https://github.com/MaxBesley/dotfiles
```

Make sure that the files `~/.bashrc`, `~/.bash_aliases`, `~/.gitconfig`, `~/.vimrc`, `~/.config/tmux/tmux.conf` and the directory `~/.config/nvim` don't already exist.
Otherwise they will need to be deleted or moved somewhere else.

Establish symlinks
```
ln --symbolic ~/dotfiles/bash/.bashrc ~/.bashrc
ln --symbolic ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln --symbolic ~/dotfiles/.gitconfig ~/.gitconfig
ln --symbolic ~/dotfiles/vim/.vimrc ~/.vimrc
ln --symbolic ~/dotfiles/nvim ~/.config/nvim
ln --symbolic ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

Then you have to go and install **vim**, **neovim**, **tmux**, **fzf** and so on.
