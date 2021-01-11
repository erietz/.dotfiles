" File: init.vim
" Author: Ethan Rietz
" Description: 
"   - Main file for neovim
"   - This file gets sourced first
"   - This file has been split up in the after/ directory which is in the rtp

call plug#begin('~/.local/share/nvim/plugged')

" Useful ones
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'chemzqm/vim-run'
Plug 'kassio/neoterm'
Plug 'ThePrimeagen/harpoon'
Plug 'liuchengxu/vim-which-key'

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
Plug '/Users/ethan/git/vim-doconce'

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
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

call plug#end()

" pandoc
"let g:pandoc#syntax#conceal#use=0  " overwritted by indentline plugin

set tabstop=4 softtabstop=4
set smartindent
set shiftwidth=4
set expandtab smarttab
set exrc
set guicursor=
set number
set relativenumber 
set ignorecase smartcase
set incsearch nohlsearch
set inccommand=split
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set wildmenu
set wildmode=longest:full,full
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

" Status line
"set laststatus=2
"set statusline=%F
"set statusline+=%=
"set statusline+=line\ %l\ of\ %L

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:vimsyn_embed = 'l'

"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce

