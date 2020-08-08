call plug#begin("~/.local/share/nvim/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
Plug 'gruvbox-community/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'vimwiki/vimwiki'
Plug 'jpalardy/vim-slime'
Plug 'lervag/vimtex'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_contrast_dark = 'medium'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
let g:gruvbox_bold=0
set background=dark 
colorscheme gruvbox

" ultisnips
"set runtimepath-=~/.vim/bundle/ultisnips/
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsExpandTrigger       = '<C-k>'
"let g:UltiSnipsJumpForwardTrigger  = '<C-k>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
let g:UltiSnipsExpandTrigger = '<localleader><tab>'
let g:UltiSnipsJumpForwardTrigger = '<localleader><tab>'
let g:UltiSnipsJumpBackwardTrigger = '<localleader><localleader><tab>'
let g:UltiSnipsListSnippets="<localleader>u"

"" vim-markdown
"let g:vim_markdown_math = 1
"let g:vim_markdown_auto_insert_bullets = 0
"let g:vim_markdown_new_list_item_indent = 0

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
"let g:vimtex_quickfix_mode=0
"let g:tex_conceal='abdmg'
"let g:vimtex_fold_manual

"-------------------------------------------------------------------------------
" Experimental settings
"-------------------------------------------------------------------------------

" Fuzzy finder
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <c-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap // :BLines<CR>
nnoremap ?? :Rg<CR>

" vim-rainbow
let g:rainbow_active = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Vim Wiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
	\{'path': '~/GD_IU/library/notes/', 
	\ 'syntax': 'markdown', 
	\ 'ext': '.md',
	\ 'path_html': '~/GD_IU/library/notes/formatted/html',
	\ 'custom_wiki2html': '$HOME/github/python/utilities/convert_vimwiki.py',},
	\{'path': '~/GD_EWR/notes/', 
	\ 'syntax': 'markdown', 
	\ 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
let g:vimwiki_table_mappings = 0
"let g:vimwiki_markdown_link_ext = 1
"

" vim-run
let g:vim_run_command_map = {
  \'javascript': 'node',
  \'php': 'php',
  \'python': 'python',
  \'zsh': 'zsh',
  \'julia': 'julia',
  \'r': 'Rscript',
  \}

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_cell_delimiter = "#--"
nnoremap <leader>m <Plug>SlimeSendCell
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

" Explorer
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Coc-pairs
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-python',
      \'coc-jedi',
      \'coc-html',
      \'coc-tsserver',
      \'coc-snippets',
      \'coc-json',
      \'coc-texlab',
      \'coc-pairs',
      \'coc-r-lsp',
      \'coc-git'
      \]
