vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.completeopt = "menu,menuone,noselect" -- Autocomplete menu
vim.opt.hidden = true -- Change buffers without having to save
vim.g.vimsyn_embed = 'lPr' -- Support embedded lua, python and ruby highlight

vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4 -- Number of spaces used for each indent
vim.opt.expandtab = false -- Use tabs rather than spaces
vim.opt.smarttab = true -- idk I just always use this
vim.opt.autoindent = true -- copy indent level last line when inserting new line

-- two space non-tab languages
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "tex", "md", "pandoc", "dart" },
    command = "setlocal tabstop=2 shiftwidth=2 expandtab"
})

-- space rather than tab languages
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "javascript", "typescript", "typescriptreact", "json" },
    command = "setlocal expandtab"
})

vim.opt.guicursor = '' -- Always use block cursor
vim.opt.scrolloff = 10 -- Adds ten lines between cursor and edge when scrolling
vim.opt.colorcolumn = '80' -- Vertical column at 80 characters

vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive search only when pattern has caps
vim.opt.incsearch = true -- Move window to search result while typing
vim.opt.hlsearch = false -- Don't keep highlight after searching

vim.opt.list = true -- Show characters like spaces and tabs in buffer
-- vim.opt.listchars = 'nbsp:¬,tab:»·,trail:·,extends:>' -- TODO make tab more visible

-- unicode may be slower
-- vim.opt.showbreak = '↪ '
-- vim.opt.listchars = 'tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨'

-- ascii only
vim.opt.listchars = 'tab:..,trail:_,extends:>,precedes:<,nbsp:~'

vim.opt.wildmenu = true -- Show command line completions
vim.opt.wildmode = 'longest:full,full'
vim.opt.mouse = 'a' -- Mouse enabled in insert mode
vim.opt.wrap = false -- Don't wrap long lines

vim.opt.backup = false -- No backup files
vim.opt.swapfile = false -- No swap files
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir' -- /home/ethan/.local/share/nvim/undodir
vim.opt.undofile = true -- Use undodir for persistent undo history

vim.opt.spellfile = vim.fn.stdpath('config') .. 'spell/en.utf-8.add' -- Spelling

vim.opt.backspace = 'indent,eol,start' -- Make backspace actually erase

vim.opt.laststatus = 3 -- Last window always and ONLY has status line

vim.opt.foldmethod = 'marker'

-- For details see :h fo-table
-- NOTE: running set formatoptions? indicates that these options are not
-- entirely respected
vim.opt.formatoptions = vim.opt.formatoptions
- "c" -- Do not wrap comments using textwidth
- "r" -- Insert comment on next line after pressing enter
+ "o" -- Insert comment after pressing o or O
+ "q" -- Allow formatting of comments with "gq"
+ "n" -- Recognize numbered lists (markdown for example)

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.gnu", "*.plot"},
    command = ":set filetype=gnuplot"
})

-- vim.opt.cmdheight = 2       -- more space for displaying messages
vim.opt.updatetime = 300 -- better performance
vim.opt.shortmess = vim.opt.shortmess + "c" -- dont pass messages to ins-completion-menu

-- netrw
-- vim.g.netrw_liststyle = 3   -- default view is tree
vim.g.netrw_banner = 0 -- no nasty banner at top
vim.g.netrw_split = 4 -- open files in previous window
vim.g.netrw_winsize = 25 -- take up 25% of the window
vim.g.netrw_keepdir = 0 -- change cwd while navigating
