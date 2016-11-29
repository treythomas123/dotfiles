syntax on                  " syntax highlighting
set number                 " show line numbers

let g:airline_powerline_fonts = 1

set termguicolors          " enable true color support in terminal
set lazyredraw             " don't redraw screen while running macros etc

colorscheme lucius
LuciusDarkHighContrast

" tweak colorscheme
hi LineNr guifg=#666666 guibg=234
hi VertSplit guifg=#666666 guibg=236
hi Search guibg=#7accef
hi Pmenu guibg=#555555 guifg=#cccccc
hi MatchParen guifg=#ffffff guibg=bg
hi Brace guifg=#aaaaaa guibg=bg
