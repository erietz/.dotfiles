" File: init.vim
" Author: Ethan Rietz
" Description: 
"   - Main file for neovim
"   - This file gets sourced first
"   - This file has been split up in the after/ directory which is in the rtp

call plug#begin('~/.local/share/nvim/plugged')

" Useful ones
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'mbbill/undotree'
Plug 'chemzqm/vim-run'
Plug 'ThePrimeagen/harpoon'
Plug 'puremourning/vimspector'

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
Plug '/home/ethan/git/vim-voodoo'

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

set tabstop=4 softtabstop=4 shiftwidth=4 smartindent expandtab smarttab
set exrc
set guicursor=
set number
set relativenumber
" searching
set ignorecase smartcase incsearch nohlsearch
set inccommand=split " neovim only preview regexes
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set wildmenu
set wildmode=longest:full,full
set mouse=i
set nowrap
set backup
set backupdir=~/.config/nvim/.backup/
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

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"
let g:vimsyn_embed = 'l'

"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce
au FileType mdvimwiki UltiSnipsAddFiletypes vimwiki
