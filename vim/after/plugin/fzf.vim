" Fuzzy finder
set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
"let g:fzf_layout = { 'down': '--40%' }


"let $FZF_DEFAULT_OPTS='--reverse'

" Quickly edit common files-----------------------------------------------------
command! CommonFiles call fzf#run(fzf#wrap(
    \{ 'source': 'cat ~/.vim/rc_files/common_files.txt && find ~/.vim/ -type f -not -path "*undodir*" -not -path "*plugged*"',
    \ 'sink': 'e',
    \ 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}']}))
command! -bang ProjectFiles call fzf#vim#files(expand("%:h"), <bang>0)

" emulate doom emacs
nnoremap <silent> <leader>. :Files<CR>
nnoremap <silent> <leader><leader> :ProjectFiles<CR>
nnoremap <silent> <leader><CR> :CommonFiles<CR>

nnoremap <c-p> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
