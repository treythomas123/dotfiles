" Indent
set listchars=tab:\ \ 

" Drop-in replacement for gofmt, but with automatic import add/remove handling
let g:go_fmt_command = "goimports"

" Additional highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1

" Don't show location list on failure
let g:go_fmt_fail_silently = 1
