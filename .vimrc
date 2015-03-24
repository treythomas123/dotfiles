" no vi compatibility
set nocompatible

" syntax highlighting
syntax on

" status line always on
set laststatus=2

" show line numbers
set number

" enable filetype detection
filetype on

" enable filetype-specific indenting
filetype indent on

" enable filetype-specific plugins
filetype plugin on

" automatically reload files when changed outside vim
set autoread

" prefer Unix line endings
set fileformat=unix
set fileformats=unix,dos

" don't redraw screen while running macros etc
set lazyredraw

" remove delay when exiting insert mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" map ; to : in normal mode so I don't have to hold down shift
nmap ; :

" use , as <leader> instead of \
let mapleader = ","

" press enter in normal mode to clear search highlighting
nnoremap <cr> :noh<cr>

" shortcut to turn on paste mode
map <leader>p :setlocal paste!<cr>

" shortcut to toggle line numbers
map <leader>ln :setlocal number!<cr>

" move this line up to the end of the previous line
map <leader>k 0dwi<BS><Esc>l

" prev/next buffer with leader q/w
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" FuzzyFind buffer with leader b
noremap <leader>b :FufBuffer<cr>
" FuzzyFind file with leader f
noremap <leader>f :FufFile<cr>

" Open NERDTree with leader nt
noremap <leader>nt :NERDTree<cr>

" don't create backup/swap files
set nobackup
set noswapfile

" use backup when saving files
set writebackup

" start searching before pressing enter
set incsearch

" highlight search results
set hlsearch

" use vundle for plugin management
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

" 4 spaces instead of tabs, be smart
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

" 2-space tabs in ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab
autocmd FileType ruby compiler ruby

" recognize .md files as markdown
autocmd BufNewFile,BufRead *.md setlocal ft=markdown

" colors
colorscheme Tomorrow
hi LineNr ctermfg=252
hi NonText ctermfg=252
hi VertSplit ctermfg=252 ctermbg=254
hi StatusLine ctermfg=252 ctermbg=0
hi Search ctermbg=253
hi link xmlEndTag Function
hi link xmlAttrib Statement
