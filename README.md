# dotfiles

My personal dotfiles.

I use [GNU stow](https://www.gnu.org/software/stow) to manage them.
This [video](https://www.youtube.com/watch?v=y6XCebnB9gs) introduces `stow` very well.


## Installation

To install these dotfiles run the following commands

```
cd ~
git clone https://github.com/MaxBesley/dotfiles ~/.dotfiles
cd .dotfiles
stow --verbose .
```

Here `GNU stow` will create the required symbolic links.
If a file/directory path from these dotfiles already exists on your machine then `stow` will detect this and abort with an error.
For example, on most new Linux machines a `~/.bashrc` file will be created by default.
To fix this simply rename, delete or move these files/directories and then run `stow .` again.

Alternatively, for a more brute-force approach, you can run
```
stow --adopt .
git restore .
```
which will effectively delete all the conflicting files/directories that already exist on your computer.

Now install

  - vim
  - neovim
  - tmux
  - fzf
  - git

and any other needed software.
