" vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning = 0

if g:unix
  let g:vimtex_view_method='zathura'
elseif g:mac
  let g:vimtex_view_method='skim'
elseif g:windows
  let g:vimtex_view_method='sumatra'
else
  echo "Something does not make sense here"
endif

"let g:vimtex_compiler_progname = 'nvr'
"set conceallevel=0
"let g:tex_conceal=''
"let g:vimtex_fold_manual
