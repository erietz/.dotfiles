" Fuzzy finder
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
"let $FZF_DEFAULT_OPTS='--reverse'

" Quickly edit common files-----------------------------------------------------
command! CommonFiles call fzf#run(fzf#wrap(
    \{ 'source': 'cat ~/.config/nvim/rc_files/common_files.txt && find ~/.config/nvim/ -type f -not -path "*undodir*"',
    \ 'sink': 'e',
    \ 'options': ['--layout=reverse', '--info=inline', '--preview', '~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}']}))
command! -bang ProjectFiles call fzf#vim#files(expand("%:h"), <bang>0)

" emulate doom emacs
nnoremap <silent> <leader>. :Files<CR>
nnoremap <silent> <leader><leader> :ProjectFiles<CR>
nnoremap <silent> <leader><CR> :CommonFiles<CR>

nnoremap <c-p> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
