" use pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" GENERAL SETTINGS
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
let g:ctrlp_working_path_mode = 0 " search in pwd instead of file dir
let g:ctrlp_show_hidden = 1 " include dotfiles in ctrlp results
let g:syntastic_javascript_checkers = ['eslint', 'jshint'] " lint javascript

" INTERFACE APPEARANCE
syntax on                  " syntax highlighting
set laststatus=2           " status line always on
set number                 " show line numbers
let g:airline_powerline_fonts = 1
colorscheme Tomorrow
hi LineNr ctermfg=252
hi VertSplit ctermfg=252 ctermbg=254
hi Search ctermbg=254
hi link xmlEndTag Function
hi link xmlAttrib Statement
hi clear swiftKeywords
hi link swiftKeywords Function
hi link sqlKeyword Function
hi link sqlStatement Function

" SEARCH BEHAVIOR
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results

" TABS
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


" FILETYPE-SPECIFIC
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd FileType ruby compiler ruby


" KEY MAPPINGS

" swap the functions of ; and :, because I use : more often
noremap ; :
noremap <Space> ;

" use , as <leader> instead of \
let mapleader = ","

" press enter in normal mode to clear search highlighting
nnoremap <cr> :noh<cr>

" shortcut to turn on paste mode
noremap <leader>p :setlocal paste!<cr>

" shortcut to toggle line numbers
noremap <leader>ln :setlocal number!<cr>

" switch windows with leader-w
nnoremap <leader>w <c-w><c-w>

" close window with leader-q
nnoremap <leader>q <c-w>q

" CtrlP buffer with leader b
nnoremap <leader>b :CtrlPBuffer<cr>

" Ctrlp files with leader f
nnoremap <leader>f :CtrlP<cr>

" Echo the highlight class under the cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" remove delay when exiting insert mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
