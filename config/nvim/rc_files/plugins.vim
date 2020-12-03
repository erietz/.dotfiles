call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
Plug 'SirVer/ultisnips'
"Plug 'luochen1990/rainbow'
Plug 'vimwiki/vimwiki'
Plug 'jpalardy/vim-slime'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'chemzqm/vim-run'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/Users/ethan/git/vim-doconce'
Plug 'kevinoid/vim-jsonc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tomasiser/vim-code-dark'
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'
Plug 'ayu-theme/ayu-vim' " or other package manager
call plug#end()

"...
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

"colorscheme gruvbox
highlight LineNr guifg=#D4BFFF

" ultisnips
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips/"
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
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal=''
"let g:vimtex_fold_manual

" markdown
"let g:pandoc#syntax#conceal#use = 0

" indentline
let g:indentLine_setColors = 0    " use colorscheme rather than grey
autocmd FileType tex,markdown,doconce let g:indentLine_setConceal = 0

" vim-rainbow
let g:rainbow_active = 1

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
  \'ruby': 'ruby',
  \'swift': 'swift',
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
  \'coc-explorer',
  \'coc-highlight',
  \'coc-python',
  \'coc-html',
  \'coc-snippets',
  \'coc-json',
  \'coc-pairs',
  \'coc-r-lsp',
  \'coc-git'
  \]
