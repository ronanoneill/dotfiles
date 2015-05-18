## Dotfiles

My dotfiles, the vast majority of which have been sourced from one or other of the following:

 - https://github.com/holman/dotfiles
 - https://github.com/ryanb/dotfiles
 - https://github.com/mathiasbynens/dotfiles
 - https://github.com/paulirish/dotfiles

## Installation

```sh
git clone https://github.com/ronanoneill/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

Will create symlinks for all files with the `.symlink` extension in `.dotfiles/dotfiles` to the home
directory. Idea is to the manage all files from within `~/.dotfiles`.
