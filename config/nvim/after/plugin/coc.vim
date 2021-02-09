"COC
set nobackup
set updatetime=50
set nowritebackup
set hidden
"set cmdheight=2
set shortmess+=c
" COC---------------------------------------------------------------------------

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

" GoTo code navigation.
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gy <Plug>(coc-type-definition)
"nmap <leader>gi <Plug>(coc-implementation)
"nmap <leader>gr <Plug>(coc-references)
"nmap <leader>rr <Plug>(coc-rename)
"nmap <leader>g[ <Plug>(coc-diagnostic-prev)
"nmap <leader>g] <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
"nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
"nnoremap <leader>cr :CocRestart

" Ultisnips related-------------------------------------------------------------
" Use <C-l> for trigger snippet expand.
"imap <leader><tab> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<leader><tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<leader><s-tab>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)

" Coc-pairs
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" coc-exporer-------------------------------------------------------------------
nnoremap <leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_global_extensions = [
  \'coc-markdownlint',
  \'coc-explorer',
  \'coc-highlight',
  \'coc-vimtex',
  \'coc-jedi',
  \'coc-clangd',
  \'coc-html',
  \'coc-snippets',
  \'coc-json',
  \'coc-pairs',
  \'coc-r-lsp',
  \'coc-git'
  \]
