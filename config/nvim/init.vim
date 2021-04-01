" vim: foldmethod=marker
" Author: Ethan Rietz
" Date: 0 A.D.
" Description: Filetype, plugin, and compiler settings are loaded elsewhere

" {{{ Plugins

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
"Plug 'puremourning/vimspector'
Plug 'itchyny/lightline.vim'
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
Plug 'erietz/vim-terminator'
Plug 'erietz/vim-doconce'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
call plug#end()
" }}}
" {{{ Options

set tabstop=2 shiftwidth=2 expandtab smarttab
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
set laststatus=2
set cursorline
set formatoptions 
      \ +=r " auto insert comment on next line
      \ +=o " auto insert comment on next line after pressing o

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:vimsyn_embed = 'lPr'
" }}}
" {{{ Mappings

" Changing window splits
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" toggle quickfix
nnoremap <leader>q :cw<CR>
nnoremap <leader>l :lw<CR>
nnoremap <leader>c :cclose<bar>lclose<CR>

" Yank to clipboard
vnoremap <leader>y "+y

" delete but don't yank
vnoremap <leader>d "_d

" paste without 
vnoremap <leader>p "_dP

" navigation
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" native grep better than plugins
command! -nargs=+ Grep execute 'silent lgrep! <args>' | lopen
command! -nargs=+ VimGrep execute 'silent lvimgrep! <q-args>' . '**/*' | lopen
nnoremap <leader>gg :Grep 
nnoremap <leader>vg :VimGrep 

" Resize windows
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" View current file and current directory
nnoremap <leader>fv :Vex<bar>set winfixwidth<CR>
nnoremap <leader>dv :Lex<bar>set winfixwidth<CR>

" Adding comments until end of line---------------------------------------------
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>
nnoremap <leader>_ :set ri<cr>50A-<esc>51<bar>d$0:set nori<cr>

" terminal mappings
tnoremap <leader><Esc> <c-\><c-n>
tnoremap <Esc><Esc> <c-\><c-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Clean up whitespace-----------------------------------------------------------
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
" }}}
