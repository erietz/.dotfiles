call plug#begin('~/.local/share/nvim/plugged')

Plug 'skywind3000/asyncrun.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'mbbill/undotree'
"Plug 'chemzqm/vim-run'
Plug 'ThePrimeagen/harpoon'
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
Plug $HOME . '/git/vim-voodoo'
Plug $HOME . '/git/vim-terminator'
Plug $HOME . '/git/vim-run'

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
set nobackup
set noswapfile
set undodir=~/.config/nvim/undodir/
set undofile
set spellfile=~/.config/nvim/spell/en.utf-8.add
"set termguicolors
set scrolloff=8
set colorcolumn=80
set backspace=indent,eol,start
set statusline=%<%f\ %h%m%r%=%-10.(%y%)\ %-14.(%l,%c%V%)\ %P
set cursorline

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

function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>


" ----------------------------------------------------------------------------
" <F5> / <F6> | Run script
" ----------------------------------------------------------------------------
function! s:run_this_script(output)
  let head   = getline(1)
  let pos    = stridx(head, '#!')
  let file   = expand('%:p')
  let ofile  = tempname()
  let rdr    = " 2>&1 | tee ".ofile
  let win    = winnr()
  let prefix = a:output ? 'silent !' : '!'
  " Shebang found
  if pos != -1
    execute prefix.strpart(head, pos + 2).' '.file.rdr
  " Shebang not found but executable
  elseif executable(file)
    execute prefix.file.rdr
  elseif &filetype == 'ruby'
    execute prefix.'/usr/bin/env ruby '.file.rdr
  elseif &filetype == 'tex'
    execute prefix.'latex '.file. '; [ $? -eq 0 ] && xdvi '. expand('%:r').rdr
  elseif &filetype == 'dot'
    let svg = expand('%:r') . '.svg'
    let png = expand('%:r') . '.png'
    " librsvg >> imagemagick + ghostscript
    execute 'silent !dot -Tsvg '.file.' -o '.svg.' && '
          \ 'rsvg-convert -z 2 '.svg.' > '.png.' && open '.png.rdr
  else
    return
  end
  redraw!
  if !a:output | return | endif

  " Scratch buffer
  if exists('s:vim_exec_buf') && bufexists(s:vim_exec_buf)
    execute bufwinnr(s:vim_exec_buf).'wincmd w'
    %d
  else
    silent!  bdelete [vim-exec-output]
    silent!  vertical botright split new
    silent!  file [vim-exec-output]
    setlocal buftype=nofile bufhidden=wipe noswapfile
    let      s:vim_exec_buf = winnr()
  endif
  execute 'silent! read' ofile
  normal! gg"_dd
  execute win.'wincmd w'
endfunction
nnoremap <silent> <F5> :call <SID>run_this_script(0)<cr>
nnoremap <silent> <F6> :call <SID>run_this_script(1)<cr>

nnoremap <leader>rr :RunFile <CR>
let g:run_command = {}
