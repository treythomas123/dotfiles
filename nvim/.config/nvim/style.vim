syntax on                  " syntax highlighting
set number                 " show line numbers
set nowrap                 " don't wrap long lines

let g:airline_powerline_fonts = 1

set termguicolors          " enable true color support in terminal
set lazyredraw             " don't redraw screen while running macros etc

colorscheme lucius
LuciusDarkHighContrast

" tweak colorscheme
hi LineNr guifg=#666666 guibg=234
hi VertSplit guifg=#666666 guibg=236
hi Search guibg=#666666 guifg=#eeeeee
hi Pmenu guibg=#555555 guifg=#cccccc
hi MatchParen guifg=#ffffff guibg=#222222
hi Brace guifg=#aaaaaa guibg=bg
hi Normal guibg=NONE ctermbg=NONE
