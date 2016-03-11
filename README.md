# vimrc
My Vim configuration file (.vimrc)

I use [pathogen](https://github.com/tpope/vim-pathogen) for loading plugins.

### Plugins
* [airline](https://github.com/vim-airline/vim-airline)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)

### Colors
* [Tomorrow](https://github.com/chriskempson/vim-tomorrow-theme/blob/master/colors/Tomorrow.vim)

You can backup your `.vimrc` and `.vim` folder and install mine using the following commands (on Mac/Linux):
```
  mv ~/.vimrc ~/.vimrc_backup
  mv ~/.vim ~/.vim_backup
  git clone https://github.com/treythomas123/vimrc.git ~/vimrc
  ln -s ~/vimrc/vimrc ~/.vimrc
  ln -s ~/vimrc/vim ~/.vim
```
