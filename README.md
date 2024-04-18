# dotfiles

My personal dotfiles.


## Installation

Download the files into your home directory
```
cd ~
git clone https://github.com/MaxBesley/dotfiles
```

Make sure that `~/.config/nvim` doesn't already exist.

Establish symlinks
```
ln --symbolic ~/dotfiles/bash/.bashrc ~/.bashrc
ln --symbolic ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
ln --symbolic ~/dotfiles/.gitignore ~/.gitignore
ln --symbolic ~/dotfiles/nvim ~/.config/nvim
```

Then you have to go and install **vim**, **neovim**, **fzf** and so on.

