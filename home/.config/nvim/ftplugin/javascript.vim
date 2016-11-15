" tern completion
autocmd FileType javascript setlocal omnifunc=tern#Complete

" neomake run eslint
let g:neomake_javascript_enabled_makers = ['eslint']
