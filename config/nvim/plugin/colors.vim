" TODO: do global variables defined in this directory
" get properly loaded? This seems not to be the case for
" colorschemes
"
"
"
"
"
"
"
"
"
" Weird workaround to fix git highlighting in gutter for tender theme
"function! MyHighlights() abort
"    hi SignColumn guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
"endfunction
"augroup MyColors
"    autocmd!
"    "autocmd ColorScheme * call MyHighlights() " for all colorscheme
"    autocmd ColorScheme tender call MyHighlights()
"augroup END
"colorscheme tender
"colorscheme gruvbox
" colorscheme PaperColor
"colorscheme onedark
colorscheme neodark
let g:neodark#use_256color = 1 " default: 0
"let g:neodark#terminal_transparent = 1 " default: 0
"colorscheme base16-default-dark
" Colorscheme
"set background=dark
"colorscheme gruvbox
"hi Search guibg=Black
"hi Search guifg=LightGrey
"highlight LineNr guifg=#8ec07c
"let g:airline_theme = 'gruvbox'
