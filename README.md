# vimrc
My Vim configuration file (.vimrc). I use [pathogen](https://github.com/tpope/vim-pathogen) for loading plugins.

### Installation

You can backup your `.vimrc` and `.vim` folder and install mine using the following commands (on Mac/Linux):
```
  git clone https://github.com/treythomas123/vimrc.git ~/vimrc
  cd ~/vimrc
  git submodule update --init
  mv ~/.vimrc ~/.vimrc_backup
  mv ~/.vim ~/.vim_backup
  ln -s ~/vimrc/vimrc ~/.vimrc
  ln -s ~/vimrc/vim ~/.vim
```

In order for the airline plugin to look right, you'll need to use a font from [powerline/fonts](https://github.com/powerline/fonts). I use `Meslo LG M Regular for Powerline`.

### Plugins
* [airline](https://github.com/vim-airline/vim-airline)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [syntastic](https://github.com/scrooloose/syntastic)
* [schlepp](https://github.com/zirrostig/vim-schlepp)

### Colors
* [Tomorrow](https://github.com/chriskempson/vim-tomorrow-theme/blob/master/colors/Tomorrow.vim)
