setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
"setlocal textwidth=80
setlocal smarttab
setlocal expandtab
set autoindent
set fileformat=unix

"noremap <leader>r :update<bar>!python3 %<CR>
"
"if !exists("current_compiler")
"  "compiler python
"  compiler pyunit
"endif
compiler pyunit
set makeprg=python3\ %

let $PYTHONUNBUFFERED=1
let b:dispatch = './%'
"nnoremap <leader>r :Dispatch<CR>:copen<CR>
