call plug#begin('~/.local/share/nvim/plugged')

if has("nvim")
  if has('nvim-0.5')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  endif
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  Plug 'radenling/vim-dispatch-neovim'
  Plug $HOME . '/git/vim-voodoo'
  Plug 'tjdevries/colorbuddy.vim'
  Plug 'tjdevries/gruvbuddy.nvim'
endif

Plug $HOME . '/git/vim-terminator'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'mbbill/undotree'
Plug 'chemzqm/vim-run'
"Plug 'ThePrimeagen/harpoon'
Plug 'puremourning/vimspector'
Plug 'chrisbra/unicode.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
"Plug 'mtth/scratch.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'pandoc'] }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

Plug 'dhruvasagar/vim-table-mode'
Plug 'SirVer/ultisnips'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'euclidianAce/BetterLua.vim'
Plug 'lervag/vimtex'
Plug 'kevinoid/vim-jsonc'
"Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ap/vim-css-color'

" My plugins
Plug $HOME . '/git/vim-doconce'
"Plug 'erietz/vim-terminator'

" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab smarttab
set exrc
set guicursor=
set number
set relativenumber
" searching
set ignorecase smartcase incsearch nohlsearch
if has("nvim")
  set inccommand=split " neovim only preview regexes
endif
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set wildmenu
set wildmode=longest:full,full
set mouse=i
set nowrap
set nobackup
set noswapfile
set undodir=~/.config/nvim/undodir/
set undofile
set spellfile=~/.config/nvim/spell/en.utf-8.add
set termguicolors
set scrolloff=8
set colorcolumn=80
set backspace=indent,eol,start
set statusline=%<%f\ %h%m%r%=%-10.(%y%)\ %-14.(%l,%c%V%)\ %P
set cursorline
set formatoptions 
      \ +=r " auto insert comment on next line
      \ +=o " auto insert comment on next line after pressing o

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
let g:vimsyn_embed = 'lPr'

function! Scratch()
  belowright split
  resize 30
  noswapfile hide enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  "setlocal nobuflisted
  "lcd ~
  file scratch
endfunction

nnoremap <leader>mf :update<bar>TerminatorSendToTerminal make<CR>
nnoremap <leader>mt :update<bar>TerminatorSendToTerminal make test<CR>
nnoremap <leader>mc :update<bar>TerminatorSendToTerminal make clean<CR>

let g:terminator_repl_delimiter_regex = '--'
"let g:terminator_split_fraction = 0.35
"let g:terminator_split_location = 'vertical botright'
