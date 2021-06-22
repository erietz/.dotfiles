vim.o.completeopt = "menuone,noselect"  -- Autocomplete menu
vim.o.hidden = true           -- Change buffers without having to save
vim.g.vimsyn_embed = 'lPr'    -- support embedded lua, python and ruby highlight

vim.wo.number = true          -- Line numbers
vim.wo.relativenumber = true  -- Relative line numbers

vim.o.tabstop = 2             -- Number of spaces a tab counts for
vim.o.shiftwidth = 2          -- Number of spaces used for each indent
vim.o.expandtab = true        -- Use spaces rather than tabs
vim.o.smarttab = true         -- idk I just always use this

vim.o.guicursor = ''          -- Always use block cursor
vim.o.scrolloff = 10          -- Adds ten lines between cursor and edge when scrolling
vim.o.colorcolumn = '80'      -- Vertical column at 80 characters

vim.o.ignorecase = true       -- Case insensitive search
vim.o.smartcase = true        -- Case sensitive search only when pattern has caps
vim.o.incsearch = true        -- Move window to search result while typing
vim.o.hlsearch = false        -- Don't keep highlight after searching

vim.o.list = true             -- Show characters like spaces and tabs in buffer
vim.o.listchars = 'nbsp:¬,tab:»·,trail:·,extends:>' -- TODO make tab more visible

vim.o.wildmenu = true         -- Show command line completions
vim.o.wildmode = 'longest:full,full'
vim.o.mouse = 'i'             -- Mouse enabled in insert mode
vim.o.wrap = false            -- Don't wrap long lines

vim.o.backup = false          -- No backup files
vim.o.swapfile = false        -- No swap files
vim.o.undodir = vim.fn.stdpath('data') .. '/undodir'  -- /home/ethan/.local/share/nvim/undodir
vim.o.undofile = true         -- Use undodir for persistent undo history

vim.o.spellfile = vim.fn.stdpath('config') .. 'spell/en.utf-8.add'  -- Spelling

vim.o.backspace = 'indent,eol,start'  -- Make backspace actually erase
vim.o.statusline = '%<%f %h%m%r%=%-10.(%y%) %-14.(%l,%c%V%) %P'   -- Add filetype
vim.o.laststatus = 2  -- Last window always has status line

vim.o.termguicolors = true    -- Better colors
vim.o.background = "dark"     -- Dark theme
vim.cmd([[colorscheme gruvbox]])  -- TODO is there a better way to set this?
