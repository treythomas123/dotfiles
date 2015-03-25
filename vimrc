" use pathogen for plugin management
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

" INTERFACE APPEARANCE
syntax on                  " syntax highlighting
set laststatus=2           " status line always on
set number                 " show line numbers
colorscheme Tomorrow
hi LineNr ctermfg=252
hi NonText ctermfg=252
hi VertSplit ctermfg=252 ctermbg=254
hi StatusLine ctermfg=252 ctermbg=0
hi Search ctermbg=253
hi link xmlEndTag Function
hi link xmlAttrib Statement

" SEARCH BEHAVIOR
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results

" TABS
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab


" FILETYPE-SPECIFIC
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd FileType ruby compiler ruby


" KEY MAPPINGS

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

" prev/next buffer with leader q/w
nmap <leader>q :bp<CR>
nmap <leader>w :bn<CR>

" FuzzyFind buffer with leader b
nmap <leader>b :FufBuffer<cr>

" FuzzyFind file with leader f
nmap <leader>f :FufFile<cr>

" Open NERDTree with leader nt
nmap <leader>nt :NERDTree<cr>


" remove delay when exiting insert mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
