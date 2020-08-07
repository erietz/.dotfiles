setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
"setlocal textwidth=80
setlocal smarttab
setlocal expandtab
set autoindent
set fileformat=unix

nnoremap <leader>c :w<CR>:!clear<CR>:!python3 %<CR>
