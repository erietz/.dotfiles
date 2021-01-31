" TODO: do global variables defined in this directory
" get properly loaded? This seems not to be the case for

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
"colorscheme neodark
"let g:neodark#use_256color = 1 " default: 0
"let g:neodark#terminal_transparent = 1 " default: 0
"colorscheme base16-default-dark

"colorscheme gruvbox
"set background=dark
"hi Search guibg=Black
"hi Search guifg=LightGrey
"highlight LineNr guifg=#8ec07c
"let g:airline_theme = 'gruvbox'

"lua require('colorbuddy').colorscheme('gruvbuddy')
"colorscheme gruvbox
"set background=dark

"dark ------------------------
"let g:voodoo_variant = 'light'
lua require('colorbuddy').colorscheme('Set3')
"lua require('colorbuddy').colorscheme('deep')

"light background -----------------
"let g:voodoo_variant = 'light'
"lua require('colorbuddy').colorscheme('husl')
"lua require('colorbuddy').colorscheme('Dark2_r')
"lua require('colorbuddy').colorscheme('gnuplot')
"lua require('colorbuddy').colorscheme('brg')

"low contrast --------------
"let g:voodoo_contrast = 'soft'
"lua require('colorbuddy').colorscheme('Pastel2')
"lua require('colorbuddy').colorscheme('Pastel1')
