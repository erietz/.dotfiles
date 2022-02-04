vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.completeopt = "menu,menuone,noselect"  -- Autocomplete menu
vim.opt.hidden = true           -- Change buffers without having to save
vim.g.vimsyn_embed = 'lPr'      -- Support embedded lua, python and ruby highlight

vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative line numbers

vim.opt.tabstop = 4             -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4          -- Number of spaces used for each indent
vim.opt.expandtab = true        -- Use spaces rather than tabs
vim.opt.smarttab = true         -- idk I just always use this
vim.opt.autoindent = true       -- copy indent level last line when inserting new line

vim.cmd([[
  augroup Indentation
    autocmd!
    autocmd FileType html setlocal tabstop=2 shiftwidth=2
    autocmd FileType css setlocal tabstop=2  shiftwidth=2
    autocmd FileType tex setlocal tabstop=2 shiftwidth=2
    autocmd FileType md setlocal tabstop=2 shiftwidth=2
  augroup END
]])

vim.opt.guicursor = ''          -- Always use block cursor
vim.opt.scrolloff = 10          -- Adds ten lines between cursor and edge when scrolling
vim.opt.colorcolumn = '80'      -- Vertical column at 80 characters

vim.opt.ignorecase = true       -- Case insensitive search
vim.opt.smartcase = true        -- Case sensitive search only when pattern has caps
vim.opt.incsearch = true        -- Move window to search result while typing
vim.opt.hlsearch = false        -- Don't keep highlight after searching

vim.opt.list = true             -- Show characters like spaces and tabs in buffer
vim.opt.listchars = 'nbsp:¬,tab:»·,trail:·,extends:>' -- TODO make tab more visible

vim.opt.wildmenu = true         -- Show command line completions
vim.opt.wildmode = 'longest:full,full'
vim.opt.mouse = 'i'             -- Mouse enabled in insert mode
vim.opt.wrap = false            -- Don't wrap long lines

vim.opt.backup = false          -- No backup files
vim.opt.swapfile = false        -- No swap files
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'  -- /home/ethan/.local/share/nvim/undodir
vim.opt.undofile = true         -- Use undodir for persistent undo history

vim.opt.spellfile = vim.fn.stdpath('config') .. 'spell/en.utf-8.add'  -- Spelling

vim.opt.backspace = 'indent,eol,start'  -- Make backspace actually erase

-- Statusline-------------------------------------
function Harpoon_status()
  local status = require('harpoon.mark').status()
  if status == '' then
    return ''
  end
  return string.format('⥤ %s', status)
end

local status_line = '' ..               -- break long string onto multiple lines
  '%{luaeval("Harpoon_status()")} ' ..  -- harpoon mark
  '%<%f' ..                             -- filename
  ' %h%m%r%=%-10.(%y%)' ..              -- dont remember
  ' %-14.(%l,%c%V%) %P'                 -- dont remember

vim.opt.statusline = status_line
vim.opt.laststatus = 2                  -- Last window always has status line
--------------------------------------------------

vim.opt.foldmethod = 'marker'

-- For details see :h fo-table
-- NOTE: running set formatoptions? indicates that these options are not
-- entirely respected

vim.opt.formatoptions = vim.opt.formatoptions
  - "c" -- Do not wrap comments using textwidth
  + "r" -- Insert comment on next line after pressing enter
  + "o" -- Insert comment after pressing o or O
  + "q" -- Allow formatting of comments with "gq"
  + "n" -- Recognize numbered lists (markdown for example)

vim.cmd([[ autocmd BufNewFile,BufRead *.gnu,*.plot :set filetype=gnuplot ]])

-- coc
-- vim.opt.cmdheight = 2       -- more space for displaying messages
vim.opt.updatetime = 300    -- better performance
vim.opt.shortmess = vim.opt.shortmess + "c"     -- dont pass messages to ins-completion-menu
