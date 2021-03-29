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
    "let g:voodoo_background = 'soft'
    "let g:voodoo_variant = 'light'
    lua require('colorbuddy').colorscheme('Set3')
    "colorscheme seoul256
else
    let g:lightline = { 'colorscheme': 'gruvbox' }
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


