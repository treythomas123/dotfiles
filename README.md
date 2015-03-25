# vimrc
My Vim configuration file (.vimrc)

I have this repository set up in `~/vimrc`, with a symlink mapping `~/.vimrc -> ~/vimrc/vimrc`

I also use the following plugins:

* [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
* [vim-scripts/FuzzyFinder](https://github.com/vim-scripts/FuzzyFinder) (requires [vim-scripts/L9](https://github.com/vim-scripts/L9))
* [bling/vim-airline](https://github.com/bling/vim-airline)
* [chriskempson/tomorrow-theme](https://github.com/chriskempson/tomorrow-theme/tree/master/vim) (theme)

You can backup your `.vimrc` and install mine using the following commands (on Mac/Linux):
```
  mv ~/.vimrc ~/.vimrc_backup
  git clone https://github.com/treythomas123/vimrc.git ~/vimrc
  ln -s ~/vimrc/vimrc ~/.vimrc
```
