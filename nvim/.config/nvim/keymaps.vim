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

" file switching
nnoremap <leader>f :Unite file -start-insert<cr>

" buffer switching
nnoremap <leader>b :Unite buffer -quick-match<cr>

" Echo the highlight class under the cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
