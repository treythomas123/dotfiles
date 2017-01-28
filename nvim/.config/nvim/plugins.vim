" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt-=preview

" Neomake
autocmd! BufWritePost * Neomake


" Airline
let g:airline_section_b = '%{expand("%:h")}'
let g:airline_section_c = '%t'
let g:airline#extensions#default#layout = [ [ 'b', 'c' ], [ 'x', 'z', 'error', 'warning' ] ]
