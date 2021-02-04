nnoremap <leader>sf :so %<CR>
"nnoremap <leader>mf :update<bar>make<bar>cw<CR>
"nnoremap <leader>mt :update<bar>make test<bar>cw<CR>
"nnoremap <leader>mc :update<bar>make clean<bar>cw<CR>
nnoremap <leader>mf :update<bar>Make<CR>
nnoremap <leader>mt :update<bar>Make test<CR>
nnoremap <leader>mc :update<bar>Make clean<CR>
nnoremap `<CR> :update<bar>Dispatch<CR>

" Quickly reload vimrc
nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim <CR>

" Changing window splits
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <A-l> <C-w>>
nnoremap <A-h> <C-w><
"nnoremap <leader>f <C-w>f<C-w>L

" toggle quickfix
"nnoremap <leader>q :copen<bar>wincmd k<CR>
nnoremap <leader>q :cw<CR>
nnoremap <leader>l :lw<CR>

" Moving of code blocks
"vnoremap < <gv
"vnoremap > >gv

" Resize windows----------------------------------------------------------------
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Explore-----------------------------------------------------------------------
"nnoremap <leader>pv :wincmd v<bar> :Vex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :Vex<CR>

" Adding comments until end of line---------------------------------------------
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>
nnoremap <leader>_ :set ri<cr>50A-<esc>51<bar>d$0:set nori<cr>

" Open a terminal in split
" for some reason overriding harpoon mapping
"nnoremap <leader>t :split <bar> terminal<CR><c-w>J :resize 10<CR> 
"tnoremap <leader><Esc> <c-\><c-n>
tnoremap <Esc><Esc> <c-\><c-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Quickly edit common files-----------------------------------------------------
"command! CommonFiles call fzf#run({'source': '( cat ~/.config/nvim/rc_files/common_files.txt && find ~/.config/nvim/ -type f -not -path "*undodir*" ; ) ', 'sink': 'e'})
command! CommonFiles call fzf#run({'source': 'cat ~/.config/nvim/rc_files/common_files.txt && find ~/.config/nvim/ -type f -not -path "*undodir*"', 'sink': 'e'})
command! -bang ProjectFiles call fzf#vim#files(expand("%:h"), <bang>0)

" emulate doom emacs
nnoremap <leader>. :Files<CR>
nnoremap <leader><leader> :ProjectFiles<CR>
nnoremap <leader><CR> :CommonFiles<CR>

nnoremap <c-p> :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap // :BLines<CR>
nnoremap ?? :Rg<CR>

" Clean up whitespace-----------------------------------------------------------
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()

" ----------------------------------------------------------------------------
" Readline-style key bindings in command-line (excerpt from rsi.vim)
" ----------------------------------------------------------------------------
cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
" Doesn't work with tiling window manager as meta key
" cnoremap        <M-b> <S-Left>
" cnoremap        <M-f> <S-Right>
silent! exe "set <S-Left>=\<Esc>b"
silent! exe "set <S-Right>=\<Esc>f"

" Yank to clipboard
vnoremap <leader>y "+y

" delete but don't yank
vnoremap <leader>d "_d

" use real mans grep 
command! -nargs=+ SoyGrep execute 'silent lgrep! <args>' | lopen
command! -nargs=+ SoyVimGrep execute 'silent lvimgrep! <args>' | lopen
nnoremap <leader>gg :SoyGrep 
nnoremap <leader>vg :SoyVimGrep 

" quickfix list mappings
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
