" use , as <leader> instead of \
let mapleader = ","

" Allow ; for :
noremap ; :

" use apostrophe for next in f/t search
noremap ' ;

" run q macro with space
noremap <space> @q

" press escape in normal mode to clear search highlighting
nnoremap <silent> <esc> :noh<cr><esc>

" shortcut to turn on paste mode
noremap <leader>p :setlocal paste!<cr>

" switch windows with leader-w
nnoremap <leader>w <c-w><c-w>

" close window with leader-q
nnoremap <leader>q <c-w>q

" tab completion if popup menu is visible
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>".deoplete#mappings#close_popup() : "<Tab>"

" file switching
nnoremap <leader>f :Unite file -start-insert<cr>

" buffer switching
nnoremap <leader>b :Unite buffer -quick-match<cr>
