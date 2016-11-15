" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview

" Neomake
autocmd! BufWritePost * Neomake
