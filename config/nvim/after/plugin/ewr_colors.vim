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
"let g:voodoo_contrast = 'hard'
"let g:voodoo_variant = 'light'
lua require('colorbuddy').colorscheme('Set3')
"lua require('colorbuddy').colorscheme('Set3_r')
"lua require('colorbuddy').colorscheme('Set2')
"lua require('colorbuddy').colorscheme('Set2_r')
"lua require('colorbuddy').colorscheme('deep')
"lua require('colorbuddy').colorscheme('hls')
"lua require('colorbuddy').colorscheme('husl')
"lua require('colorbuddy').colorscheme('Paired')
"lua require('colorbuddy').colorscheme('Paired_r')
"lua require('colorbuddy').colorscheme('Spectral')
"lua require('colorbuddy').colorscheme('Spectral_r')
"lua require('colorbuddy').colorscheme('RdYlBu')
"lua require('colorbuddy').colorscheme('RdYlGn')
"lua require('colorbuddy').colorscheme('PiYG')
"lua require('colorbuddy').colorscheme('Accent_r')
"lua require('colorbuddy').colorscheme('spring_r')
"lua require('colorbuddy').colorscheme('tab20c')

"light background -----------------
"let g:voodoo_variant = 'light'
"lua require('colorbuddy').colorscheme('twilight_r')
"lua require('colorbuddy').colorscheme('tab20b_r')
"lua require('colorbuddy').colorscheme('husl')
"lua require('colorbuddy').colorscheme('Dark2_r')
"lua require('colorbuddy').colorscheme('gnuplot')
"lua require('colorbuddy').colorscheme('brg')
"lua require('colorbuddy').colorscheme('dark')
"lua require('colorbuddy').colorscheme('Set1_r')
"lua require('colorbuddy').colorscheme('plasma')
"lua require('colorbuddy').colorscheme('tab10')
"lua require('colorbuddy').colorscheme('tab10_r')

"low contrast --------------
"let g:voodoo_contrast = 'soft'
"lua require('colorbuddy').colorscheme('Pastel2')
"lua require('colorbuddy').colorscheme('Pastel2_r')
"lua require('colorbuddy').colorscheme('Pastel1_r')
"lua require('colorbuddy').colorscheme('Set3_r')
"lua require('colorbuddy').colorscheme('coolwarm_r')
"lua require('colorbuddy').colorscheme('vlag_r')
