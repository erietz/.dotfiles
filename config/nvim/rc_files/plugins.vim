call plug#begin("~/.local/share/nvim/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
Plug 'gruvbox-community/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'vimwiki/vimwiki'
Plug 'jpalardy/vim-slime'
Plug 'lervag/vimtex'
Plug 'chemzqm/vim-run'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_contrast_dark = 'soft'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
let g:gruvbox_bold=0
set background=dark 
colorscheme gruvbox

" ultisnips
let g:UltiSnipsExpandTrigger = '<localleader><tab>'
let g:UltiSnipsJumpForwardTrigger = '<localleader><tab>'
let g:UltiSnipsJumpBackwardTrigger = '<localleader><localleader><tab>'
let g:UltiSnipsListSnippets='<localleader>u'

" Fuzzy finder
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
"let g:vimtex_quickfix_mode=0
"let g:tex_conceal='abdmg'
"let g:vimtex_fold_manual

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
  \'python': 'python3',
  \'zsh': 'zsh',
  \'julia': 'julia',
  \'r': 'Rscript',
  \}

let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_cell_delimiter = "#--"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

" Coc-pairs
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-python',
      \'coc-html',
      \'coc-tsserver',
      \'coc-snippets',
      \'coc-json',
      \'coc-texlab',
      \'coc-pairs',
      \'coc-r-lsp',
      \'coc-git'
      \]
