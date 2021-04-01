
function EWRcolorscheme(nvim_scheme, vim_scheme)
  if has('nvim')
    let l:scheme = a:nvim_scheme
  else
    let l:scheme = a:vim_scheme
  endif
  let l:lightline_status_dict = {
        \ 'colorscheme': scheme,
        \ 'active': {
        \ 'left': [ 
        \   [ 'mode', 'paste' ],
        \   [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
        \ ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ },
        \ }
  if has('nvim')
    "let g:voodoo_background = 'soft'
    "let g:voodoo_variant = 'light'
    let g:lightline = l:lightline_status_dict
    execute printf('colorscheme %s', l:scheme)
  else
    let g:lightline = l:lightline_status_dict
    execute printf('colorscheme %s', l:scheme)
  endif
endfunction

call EWRcolorscheme('Set3', 'seoul256')
