set relativenumber
set ignorecase
set smartcase
set spellfile=~/.config/nvim/spell/en.utf-8.add
set wildmenu
set wildmode=longest:full,full
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a
set nowrap
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set updatetime=50
set backspace=indent,eol,start
highlight ColorColumn ctermbg=0 guibg=lightgrey
"COC
set nobackup
set nowritebackup
set hidden
set cmdheight=2
set shortmess+=c

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

source ~/.config/nvim/rc_files/mappings.vim
source ~/.config/nvim/rc_files/functions.vim
source ~/.config/nvim/rc_files/plugins.vim
