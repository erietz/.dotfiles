""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_fold_enabled=1	" latex folding

""""""this works but annoying
""""""autocmd BufWinLeave *.tex !latexmk -c
""""""
""""""autocmd VimLeave !latexmk -c
""""""set textwidth=80 	" force text to new line after 80 characters
set tabstop=2
set shiftwidth=2
set expandtab

"autocmd BufNewFile,BufRead *.cls set syntax=tex
map <leader>c :w<CR><space>:!latexmk -pdf %<CR>
"map  :w<CR><space>:!latexmk -pdf %<CR>
"<CR>

set spell
