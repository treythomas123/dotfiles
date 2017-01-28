" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview

" Neomake
autocmd! BufWritePost * Neomake

" Git Gutter
let g:gitgutter_sign_column_always = 1

" Airline
let g:airline_section_b = '%{expand("%:h")}'
let g:airline_section_c = '%t'
let g:airline#extensions#default#layout = [ [ 'b', 'c' ], [ 'x', 'z', 'error', 'warning' ] ]
