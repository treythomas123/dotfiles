# dotfiles

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

To install the dotfiles for a certain tool, clone this repo into a subfolder of 
your home dir, `cd` into the folder, and run `stow` for that tool.

So to get my `zsh` config, run the following:

```
git clone https://github.com/treythomas123/dotfiles ~/treythomas123-dotfiles
cd ~/treythomas123-dotfiles
stow zsh
```
