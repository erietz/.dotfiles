" File: init.vim
" Author: Ethan Rietz
" Description: Configuration file for neovim

call plug#begin('~/.local/share/nvim/plugged')
" Useful ones
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
"Plug 'yggdroot/indentline'
"Plug 'jpalardy/vim-slime'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" markdown
"let g:pandoc#syntax#conceal#use=0  " overwritted by indentline plugin

" indentline
"let g:indentLine_setColors = 0    " use colorscheme rather than grey
"autocmd FileType tex,markdown,doconce,pandoc let g:indentLine_setConceal = 0

" vim-rainbow
"let g:rainbow_active = 1

set relativenumber
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

" Status line
set laststatus=2
set statusline=%F
"set statusline+=%=
"set statusline+=line\ %l\ of\ %L

let g:vimsyn_embed = 'l'

"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce
