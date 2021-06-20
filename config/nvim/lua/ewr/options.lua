vim.g.vimsyn_embed = 'lPr'

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

vim.o.guicursor = ''
vim.o.scrolloff = 10
vim.o.colorcolumn = '80'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

vim.o.list = true
vim.o.listchars = 'nbsp:¬,tab:»·,trail:·,extends:>'

vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.mouse = 'i'
vim.o.wrap = false

vim.o.backup = false
vim.o.swapfile = false
vim.o.undodir = '~/.config/nvim/undodir/'
vim.o.undofile = true

vim.o.spellfile = '~/.config/nvim/spell/en.utf-8.add'

vim.o.backspace = 'indent,eol,start'
vim.o.statusline = '%<%f %h%m%r%=%-10.(%y%) %-14.(%l,%c%V%) %P'
vim.o.laststatus = 2

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
