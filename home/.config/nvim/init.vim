" use pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

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

" Search
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results
set ignorecase             " case-insensitive search
set smartcase              " capital letters trigger case-sensitive search

" Appearance
syntax on                  " syntax highlighting
set number                 " show line numbers
let g:airline_powerline_fonts = 1
set termguicolors
colorscheme lucius
LuciusDarkHighContrast
hi LineNr guifg=#666666 guibg=234
hi VertSplit guifg=#666666 guibg=236
hi Search guibg=#005faf
hi Pmenu guibg=#555555

" Indent
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set listchars=tab:⟶\ 
set list

" use , as <leader> instead of \
let mapleader = ","

" Allow ; for :
noremap ; :

" use apostrophe for next in f/t search
noremap ' ;

" run q macro with space
noremap <space> @q

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

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>".deoplete#mappings#close_popup() : "<Tab>"

" tern
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Unite
nnoremap <leader>f :Unite file -start-insert<cr>
nnoremap <leader>b :Unite buffer -quick-match<cr>

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" Schelpp
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
