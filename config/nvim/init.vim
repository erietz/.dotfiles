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
Plug 'ThePrimeagen/harpoon'
Plug 'liuchengxu/vim-which-key'
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

" pandoc
"let g:pandoc#syntax#conceal#use=0  " overwritted by indentline plugin

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
set backupdir=~/.config/nvim/.backup/
set directory=~/.config/nvim/.swp/
set undodir=~/.config/nvim/undodir/
set undofile
set spellfile=~/.config/nvim/spell/en.utf-8.add
set termguicolors
set scrolloff=8
set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey
set backspace=indent,eol,start
set statusline=%<%f\ %h%m%r%=%-10.(%y%)\ %-14.(%l,%c%V%)\ %P


let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:vimsyn_embed = 'l'

"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce

" Vim Wiki

au FileType mdvimwiki UltiSnipsAddFiletypes vimwiki

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
  \{'path': '~/GD_IU/library/notes/',
  \ 'syntax': 'markdown',
  \ 'ext': '.mdvimwiki',
  \ 'path_html': '~/GD_IU/library/notes/formatted/html',
  \ 'custom_wiki2html': '$HOME/github/python/utilities/convert_vimwiki.py',},
  \{'path': '~/GD_EWR/notes/',
  \ 'syntax': 'markdown',
  \ 'ext': '.mdvimwiki'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
let g:vimwiki_table_mappings = 0
"let g:vimwiki_markdown_link_ext = 1
"

"set filetype=vimwiki.markdown
"setlocal shiftwidth=2
"let g:vimwiki_folding='syntax'
""let g:vimwiki_folding='expr'
