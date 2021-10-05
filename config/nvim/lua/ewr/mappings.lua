-- Author      : Ethan Rietz
-- Date        : now
-- Description :
--  Most keybindings are defined here. Completion and snippet plugins have a
--  few keybindings defined in other files

local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

-- Basic vim maps {{{

-- Changing Window splits
map('n', '<c-h>', ':wincmd h<CR>', silent_noremap)
map('n', '<c-j>', ':wincmd j<CR>', silent_noremap)
map('n', '<c-k>', ':wincmd k<CR>', silent_noremap)
map('n', '<c-l>', ':wincmd l<CR>', silent_noremap)
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], silent_noremap)
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], silent_noremap)
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], silent_noremap)
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], silent_noremap)

-- Toggle quickfix
map('n', '<leader>q', ':copen<CR>', noremap)
map('n', '<leader>l', ':lopen<CR>', noremap)
map('n', '<leader>c', ':cclose<bar>lclose<CR>', noremap)

-- Yank to clipboard
if vim.fn.has('mac') == 1 then
  map('v', '<leader>y', '"*y', noremap)
  map('n', '<leader>p', '"*p', noremap)
else
  map('v', '<leader>y', '"+y', noremap)
  map('n', '<leader>p', '"+p', noremap)
end

-- Delete without fudging registers
map('v', '<leader>d', '"_d', noremap)
map('n', '<leader>d', '"_d', noremap)

-- ThePrimeagen
map('n', '<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], noremap)
map('n', 'Y', 'y$', noremap)
map('n', 'n', 'nzzzv', noremap)
map('n', 'N', 'Nzzzv', noremap)
map('n', 'J', 'mzJ`z', noremap)
map('i', ',', ',<c-g>u', noremap)
map('i', '.', '.<c-g>u', noremap)
map('i', '!', '!<c-g>u', noremap)
map('i', '?', '?<c-g>u', noremap)
map('v', 'J', [[:m '>+1<CR>gv=gv]], noremap)
map('v', 'K', [[:m '<-2<CR>gv=gv]], noremap)
map('n', '<leader>j', ':m .+1<CR>==', noremap)
map('n', '<leader>k', ':m .-2<CR>==', noremap)

-- Navigation
map('n', ']q', ':cnext<CR>zz', noremap)
map('n', '[q', ':cprev<CR>zz', noremap)
map('n', ']l', ':lnext<CR>zz', noremap)
map('n', '[l', ':lprev<CR>zz', noremap)
map('n', ']b', ':bnext<CR>zz', noremap)
map('n', '[b', ':bprev<CR>zz', noremap)
map('n', ']t', ':tnext<CR>zz', noremap)
map('n', '[t', ':tprev<CR>zz', noremap)

-- Resize windows
map('n', '<Left>', ':vertical resize -2<CR>', noremap)
map('n', '<Right>', ':vertical resize +2<CR>', noremap)
map('n', '<Up>', ':resize -2<CR>', noremap)
map('n', '<Down>', ':resize +2<CR>', noremap)

-- View current file and current directory
map('n', '<leader>fv', ':NvimTreeFindFile<CR>', silent_noremap)
map('n', '<leader>dv', ':NvimTreeToggle<CR>', silent_noremap)

-- Printing lists
function insert_range()
  local start = vim.fn.input("start: ")
  local stop = vim.fn.input("stop: ")
  local step = vim.fn.input("[step]: ")
  if step == "" then
    step = 1
  end
  local list = {}
  for i = start, stop, step do
    table.insert(list, i)
  end
  list =  '[' .. table.concat(list, ', ') .. ']'
  vim.cmd('normal a' .. list)
end
map('n', '<leader>ir', [[:lua insert_range()<CR>]], noremap)

-- Trim Whitespace of current file
function trim_whitespace() 
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

-- Add comment to end of line
map('n', '<leader>-', [[80A-<ESC>81<BAR>d$_<CR>]], silent_noremap)
map('n', '<leader>_', [[50A-<ESC>51<BAR>d$_<CR>]], silent_noremap)

--}}}
---- Telescope {{{

--map('n', '<leader>ff', [[:lua require('telescope.builtin').find_files()<cr>]], noremap)
--map('n', '<leader><leader>', [[:lua require('telescope.builtin').git_files()<cr>]], noremap)
--map('n', '<leader>fg', [[:lua require('telescope.builtin').live_grep()<cr>]], noremap)
--map('n', '<leader>fb', [[:lua require('telescope.builtin').buffers()<cr>]], noremap)
--map('n', '<leader>fd', [[:lua require('telescope.builtin').file_browser()<cr>]], noremap)
--map('n', '<leader>fh', [[:lua require('telescope.builtin').help_tags()<cr>]], noremap)
--map('n', '<leader>fc', [[:lua require('telescope.builtin').git_commits()<cr>]], noremap)
--map('n', '<leader>fi', [[:lua require('telescope.builtin').builtin()<cr>]], noremap)
--map('n', '<leader><CR>', ':lua dotfiles()<cr>', noremap)

--function dotfiles()
--  require('telescope.builtin').find_files({
--    follow = true,
--    hidden = true,
--    search_dirs = {
--      "$HOME/.ewr/",
--    }
--  })
--end

----}}}
-- vim-test {{{

map('n', '<leader>tn', ':TestNearest<CR>', noremap)
map('n', '<leader>ts', ':TestSuite<CR>', noremap)
map('n', '<leader>tf', ':TestFile<CR>', noremap)
map('n', '<leader>tl', ':TestLast<CR>', noremap)
map('n', '<leader>tv', ':TestVisit<CR>', noremap)
map('n', '<leader>tt', ':TestNearest -strategy=neovim<CR>', noremap)

--}}}
-- nvim-dap {{{

map('n', '<F5>',  [[:lua require('dap').continue()<CR>]], silent_noremap)
-- map('n', '<leader>5',  [[:lua require('dap').continue()<CR>]], silent_noremap)

map('n', '<F9>',  [[:lua require('dap').toggle_breakpoint()<CR>]], silent_noremap)
-- map('n', '<leader>9',  [[:lua require('dap').toggle_breakpoint()<CR>]], silent_noremap)

map('n', '<F10>', [[:lua require('dap').step_over()<CR>]], silent_noremap)
-- map('n', '<leader>0', [[:lua require('dap').step_over()<CR>]], silent_noremap)

map('n', '<F11>', [[:lua require('dap').step_into()<CR>]], silent_noremap)
-- map('n', '<leader>-', [[:lua require('dap').step_into()<CR>]], silent_noremap)

map('n', '<F12>', [[:lua require('dap').step_out()<CR>]], silent_noremap)
-- map('n', '<leader>=', [[:lua require('dap').step_out()<CR>]], silent_noremap)

-- UI
map('n', '<F8>', [[:lua require("dapui").toggle()<CR>]], silent_noremap)
-- map('n', '<leader>8', [[:lua require("dapui").toggle()<CR>]], silent_noremap)

-- python
map('n', '<leader>dc', [[:lua require("dap-python").test_class()<CR>]], silent_noremap)
map('n', '<leader>dm', [[:lua require("dap-python").test_method()<CR>]], silent_noremap)
map('v', '<leader>ds', [[:lua require("dap-python").debug_selection()<CR>]], silent_noremap)

--}}}
-- vim-easy-align {{{

map('n', 'ga', '<Plug>(EasyAlign)', {})
map('x', 'ga', '<Plug>(EasyAlign)', {})

--}}}
-- Harpoon {{{

map('n', '<leader>ha', [[:lua require('harpoon.mark').add_file()<CR>]], noremap)
map('n', '<leader>ht', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]], silent_noremap)
map('n', '<leader>h1', [[:lua require('harpoon.ui').nav_file(1)<CR>]], silent_noremap)
map('n', '<leader>h2', [[:lua require('harpoon.ui').nav_file(2)<CR>]], silent_noremap)
map('n', '<leader>h3', [[:lua require('harpoon.ui').nav_file(3)<CR>]], silent_noremap)
map('n', '<leader>h4', [[:lua require('harpoon.ui').nav_file(4)<CR>]], silent_noremap)

--}}}
-- FZF {{{

map('n', '<leader><Enter>', ':Files<CR>', noremap)
map('n', '<leader><Tab>',   ':Buffers<CR>', noremap)
map('n', '<leader>rg', ':Rg<CR>', noremap)
map('n', '<leader>fz', ':FZF<CR>', noremap)
map('n', '<leader>df', ':Files ~/.ewr<CR>', noremap)
map('n', '<leader>gf', ':GFiles<CR>', noremap)
map('n', '<leader>gs', ':GFiles?<CR>', noremap)
map('n', '<leader>gc', ':Commits<CR>', noremap)

-- }}}
