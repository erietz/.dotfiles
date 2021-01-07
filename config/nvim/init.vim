" vim: set foldmethod=marker foldlevel=0 nomodeline:
" ----------------------------------------------------------------------------
" File: init.vim
" Author: Ethan Rietz
" Description: Configuration file for neovim
" ----------------------------------------------------------------------------
" Plugins come first {{{
" ----------------------------------------------------------------------------
" Plug section {{{

call plug#begin('~/.local/share/nvim/plugged')
" Useful ones
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'mbbill/undotree'
Plug 'yggdroot/indentline'
Plug 'jpalardy/vim-slime'
Plug 'chemzqm/vim-run'
Plug 'ThePrimeagen/harpoon'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'pandoc'] }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

Plug 'dhruvasagar/vim-table-mode'
Plug 'SirVer/ultisnips'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'kevinoid/vim-jsonc'
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ap/vim-css-color'

" My plugins
Plug '/Users/ethan/git/vim-doconce'

" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Delete?
"Plug 'luochen1990/rainbow'
"Plug 'vim-utils/vim-man'
call plug#end()
" }}}
" Plugin Settings {{{

colorscheme PaperColor
"colorscheme tender
"colorscheme base16-default-dark
" Colorscheme
"set background=dark
"colorscheme gruvbox
"hi Search guibg=Black
"hi Search guifg=LightGrey
"highlight LineNr guifg=#8ec07c
"let g:airline_theme = 'gruvbox'

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
"set conceallevel=0
"let g:tex_conceal=''
"let g:vimtex_fold_manual

" markdown
"let g:pandoc#syntax#conceal#use = 0  " does nothing

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
  \'sh': 'sh',
  \'julia': 'julia',
  \'r': 'Rscript',
  \'ruby': 'ruby',
  \'swift': 'swift',
  \}

" vim-slime
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
  \'coc-pyright',
  \'coc-html',
  \'coc-snippets',
  \'coc-json',
  \'coc-pairs',
  \'coc-r-lsp',
  \'coc-git'
  \]

" }}}
" }}}
" Basic settings {{{
"-------------------------------------------------------------------------------
syntax on
filetype plugin indent on
"set relativenumber
set ignorecase smartcase
set incsearch hlsearch
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set wildmenu
set wildmode=longest:full,full
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab smarttab
set smartindent
set mouse=i
set nowrap
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set spellfile=~/.config/nvim/spell/en.utf-8.add
set termguicolors
set scrolloff=8
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set backspace=indent,eol,start
"COC
set nobackup
set updatetime=50
set nowritebackup
set hidden
set cmdheight=2
set shortmess+=c

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25


" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
  au!
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function! LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
" }}}
" AUTOCMD {{{
"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce
" }}}
" Mappings {{{
let mapleader=" "
let maplocalleader=","

" Yank to clipboard
vnoremap <leader>y "+y

" Easier to save
nnoremap ;w :update<CR>
nnoremap <leader>s :update<CR>

" delete but don't yank
vnoremap <leader>d "_d

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

" Resize windows----------------------------------------------------------------
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Explore-----------------------------------------------------------------------
"nnoremap <leader>pv :wincmd v<bar> :Vex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :Vex<CR>

" Adding comments until end of line---------------------------------------------
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>
nnoremap <leader>_ :set ri<cr>50A-<esc>51<bar>d$0:set nori<cr>

" Open a terminal in split
nnoremap <leader>t :new \| terminal<CR><c-w>J :resize 10<CR>

nnoremap <leader>tf :call GotoBuffer(0)<CR>
nnoremap <leader>td :call GotoBuffer(1)<CR>
nnoremap <leader>ts :call GotoBuffer(2)<CR>
nnoremap <leader>ta :call GotoBuffer(3)<CR>

" Quickly edit common files-----------------------------------------------------
command! CommonFiles call fzf#run({'source': '( cat ~/.config/nvim/rc_files/common_files.txt && find ~/.config/nvim/ -type f -not -path "*undodir*" ; ) ', 'sink': 'e'})
nnoremap <leader>f :CommonFiles<CR>

nnoremap <c-p> :Files<CR>
nnoremap <leader>. :Files<CR>
nnoremap <leader><leader> :Files<CR>
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

" Slime-------------------------------------------------------------------------
nnoremap <leader>m <Plug>SlimeSendCell

" COC---------------------------------------------------------------------------
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

" vim-run-----------------------------------------------------------------------
nnoremap <leader>r :Run<CR>
vnoremap <leader>r :Run<CR>

" coc-exporer-------------------------------------------------------------------
nnoremap <leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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
" }}}
