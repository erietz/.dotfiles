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


"hi Search guibg=Black
"hi Search guifg=LightGrey
"highlight LineNr guifg=#8ec07c

"lua require('colorbuddy').colorscheme('gruvbuddy')

if has("nvim")
    let g:lightline = {
          \ 'colorscheme': 'Set3',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'FugitiveHead'
          \ },
          \ }
    lua require('colorbuddy').colorscheme('Set3')
else
    "let g:lightline = { 'colorscheme': 'gruvbox' }
    colorscheme gruvbox
    set background=dark
endif

"dark ------------------------

function ColorChange()
    let voodoo_favs = ['Set3', 'husl', 'Pastel2']
    let current_scheme_index = index(voodoo_favs, g:colors_name)
    if current_scheme_index == len(voodoo_favs) - 1
        let current_scheme_index = -1
    endif
    let next_scheme = voodoo_favs[current_scheme_index + 1]
    let cmd = 'lua require(''colorbuddy'').colorscheme(''' . next_scheme . ''')'
    execute(cmd)
    echo cmd
endfunction


