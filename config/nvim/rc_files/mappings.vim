let mapleader=" "
let maplocalleader=","

" Yank to clipboard
vnoremap <leader>y "*y

" Easier to save 
inoremap ;w :w<Enter>
nnoremap ;w :w<Enter>
	
" Status line
set laststatus=2
set statusline=%F
"set statusline+=%=
"set statusline+=line\ %l\ of\ %L

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

" Formatting paragraphs
nnoremap <leader>q gqap

" Moving of code blocks
vnoremap < <gv  
vnoremap > >gv  

" Adding comments until end of line
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>

" Quickly edit common files
command! CommonFiles call fzf#run({'source': 'cat ~/.config/nvim/rc_files/common_files.txt', 'sink': 'e'})
nnoremap <leader>f :CommonFiles<CR>

nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap // :BLines<CR>
nnoremap ?? :Rg<CR>

" Slime
nnoremap <leader>m <Plug>SlimeSendCell

" COC
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

nnoremap <leader>r :Run<CR>
vnoremap <leader>r :Run<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Explorer
nnoremap <leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
