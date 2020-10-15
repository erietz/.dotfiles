set relativenumber
set ignorecase
set smartcase
set incsearch
set spellfile=~/.config/nvim/spell/en.utf-8.add
set wildmenu
set wildmode=longest:full,full
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=i
set nowrap
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set scrolloff=8
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set backspace=indent,eol,start
set foldmethod=syntax "may slow down vim (put in json specific file)
"COC
set nobackup
set updatetime=50
set nowritebackup
set hidden
set cmdheight=2
set shortmess+=c

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.snippets set filetype=snippets
au BufNewFile,BufFilePre,BufRead *.zsh,*.slurm,*.torque,*.pbs set filetype=zsh
au BufNewFile,BufFilePre,BufRead *.do,*.do.txt set filetype=doconce

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

source ~/.config/nvim/rc_files/mappings.vim
source ~/.config/nvim/rc_files/functions.vim
source ~/.config/nvim/rc_files/plugins.vim
