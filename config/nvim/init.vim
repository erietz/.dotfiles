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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'mbbill/undotree'
Plug 'puremourning/vimspector'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
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
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ap/vim-css-color'
" My plugins
Plug $HOME . '/git/vim-terminator'
Plug 'erietz/vim-doconce'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab smarttab
set exrc
set guicursor=
set number
set relativenumber
" searching
set ignorecase smartcase incsearch nohlsearch
if has("nvim")
  set inccommand=split
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

command TestCommand -nargs=+ default text here <q-args>
