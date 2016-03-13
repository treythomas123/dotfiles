" use pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible           " no vi compatibility
filetype on                " enable filetype detection
filetype indent on         " enable filetype-specific indenting
filetype plugin on         " enable filetype-specific plugins
set lazyredraw             " don't redraw screen while running macros etc
set fileformat=unix        " prefer Unix line endings
set fileformats=unix,dos
set autoread               " automatically reload files when changed outside vim
set nobackup               " don't create backup files while editing
set noswapfile             " don't create swap files while editing
set writebackup            " use backup when saving files
set hidden                 " Allow switching buffers without saving

" Turn off bells
set noerrorbells visualbell t_vb=

" Search
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results
set ignorecase             " case-insensitive search
set smartcase              " capital letters trigger case-sensitive search

" use , as <leader> instead of \
let mapleader = ","

" CtrlP 
let g:ctrlp_working_path_mode = 0 " search in pwd instead of file dir
let g:ctrlp_show_hidden = 1 " include dotfiles in ctrlp results
set wildignore+=*/.npm/*,*/node_modules/*
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" Syntastic
"let g:syntastic_javascript_checkers = ['eslint', 'jshint'] " lint javascript

let g:neomake_javascript_enabled_makers = ['eslint']


" Appearance
syntax on                  " syntax highlighting
set laststatus=2           " status line always on
set number                 " show line numbers
let g:airline_powerline_fonts = 1
colorscheme lucius
LuciusDarkHighContrast
hi LineNr ctermfg=240 ctermbg=236
hi VertSplit ctermfg=233 ctermbg=236

" Indent
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set listchars+=tab:⟶\ ,eol:\ 
set list
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab


" Allow ; for :, and use space for ;
noremap ; :
noremap <Space> ;

" press enter in normal mode to clear search highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" shortcut to turn on paste mode
noremap <leader>p :setlocal paste!<cr>

" shortcut to toggle line numbers
noremap <leader>ln :setlocal number!<cr>

" switch windows with leader-w
nnoremap <leader>w <c-w><c-w>

" close window with leader-q
nnoremap <leader>q <c-w>q

" Echo the highlight class under the cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" reload vimrc
nnoremap <leader>v :so $MYVIMRC<cr>

" remove delay when exiting insert mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
