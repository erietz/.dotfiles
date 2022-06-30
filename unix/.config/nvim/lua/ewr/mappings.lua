-- I try to keep most, if not all, of my remaps in this file including for
-- plugins.

local remap = require("ewr.keymap")
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap
local tnoremap = remap.tnoremap
local xnoremap = remap.xnoremap

-- Basic vim maps {{{

-- Quick toggle between previous buffer
nnoremap('<leader><leader>', '<c-^>')

-- toggle netrw
nnoremap('<leader>dv', ':NERDTreeToggle<CR>')     -- project view
nnoremap('<leader>fv', ':NERDTreeFind<CR>')     -- file view

-- Changing Window splits
nnoremap('<c-h>', ':wincmd h<CR>', { silent = true })
nnoremap('<c-j>', ':wincmd j<CR>', { silent = true })
nnoremap('<c-k>', ':wincmd k<CR>', { silent = true })
nnoremap('<c-l>', ':wincmd l<CR>', { silent = true })
tnoremap('<C-h>', [[<C-\><C-n><C-w>h]], { silent = true })
tnoremap('<C-j>', [[<C-\><C-n><C-w>j]], { silent = true })
tnoremap('<C-k>', [[<C-\><C-n><C-w>k]], { silent = true })
tnoremap('<C-^>', [[<C-\><C-n><C-^>l]], { silent = true })
tnoremap('<C-o>', [[<C-\><C-n><C-^>l]], { silent = true })
tnoremap('<localleader><localleader>', [[<C-\><C-n><C-^>l]], { silent = true })

-- Toggle quickfix
nnoremap('<leader>q', ':copen<CR>')
nnoremap('<leader>w', ':lopen<CR>')    -- "window specific quickfix
nnoremap('<leader>oo', ':TerminatorOutputBufferToggle<CR>')
nnoremap('<leader>c', ':cclose<bar>lclose<bar>TerminatorOutputBufferClose<CR>')

-- Yank to clipboard
if vim.fn.has('mac') == 1 then
  vnoremap('<leader>y', '"*y')
  nnoremap('<leader>p', '"*p')
else
  vnoremap('<leader>y', '"+y')
  nnoremap('<leader>p', '"+p')
end

-- Delete without fudging registers
vnoremap('<leader>d', '"_d')
nnoremap('<leader>d', '"_d')

-- ThePrimeagen
nnoremap('<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap('Y', 'y$')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('J', 'mzJ`z')
inoremap(',', ',<c-g>u')
inoremap('.', '.<c-g>u')
inoremap('!', '!<c-g>u')
inoremap('?', '?<c-g>u')
-- vnoremap('J', [[:m '>+1<CR>gv=gv]])
-- vnoremap('K', [[:m '<-2<CR>gv=gv]])
-- noremap('<leader>j', ':m .+1<CR>==')
-- noremap('<leader>k', ':m .-2<CR>==')

-- Navigation
nnoremap(']q', ':cnext<CR>zz')
nnoremap('[q', ':cprev<CR>zz')
nnoremap(']w',   ':lnext<CR>zz')
nnoremap('[w', ':lprev<CR>zz')
nnoremap(']b', ':bnext<CR>zz')
nnoremap('[b', ':bprev<CR>zz')
nnoremap(']t', ':tnext<CR>zz')
nnoremap('[t', ':tprev<CR>zz')

-- scrolling down with left hand only gives me carpel tunnel
nnoremap('<c-y>', '<c-d>')

-- Scroll split
nnoremap('<c-m-f>', '<c-w><c-w><c-d><c-w><c-w>')
nnoremap('<c-m-b>', '<c-w><c-w><c-u><c-w><c-w>')

-- Resize windows
nnoremap('<Left>', ':vertical resize -2<CR>')
nnoremap('<Right>', ':vertical resize +2<CR>')
nnoremap('<Up>', ':resize -2<CR>')
nnoremap('<Down>', ':resize +2<CR>')

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
nnoremap('<leader>ir', insert_range)

-- Trim Whitespace of current file
function trim_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

-- Add comment to end of line
nnoremap('<leader>-', [[80A-<ESC>81<BAR>d$_<CR>]], { silent = true })
nnoremap('<leader>_', [[50A-<ESC>51<BAR>d$_<CR>]], { silent = true })

-- fix lsp diagnostics
nnoremap('<leader>e', ':CocDiagnostics<CR>', { silent = true })

-- Dispatch
nnoremap('<leader>mr', ':Make run<CR>', { silent = true })
nnoremap('<leader>mb', ':Make build<CR>', { silent = true })
nnoremap('<leader>mt', ':Make test<CR>', { silent = true })
nnoremap('<leader>mc', ':Make clean<CR>', { silent = true })

-- Grep word
-- noremap('<leader>gw', [[:Ggrep -q -I "\<C-r><C-w>\>" .<CR>]], { silent = true })
nnoremap('<leader>psw', [[:cfdo %s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap('<leader>pwu', [[:cfdo normal u]])

--}}}
-- Telescope {{{

nnoremap('<leader><Enter>', function() require('telescope.builtin').find_files() end)
nnoremap('<leader><Tab>', function() require('telescope.builtin').buffers() end)
nnoremap('<c-p>', function() require('telescope.builtin').git_files() end)
nnoremap('<leader>fg', function() require('telescope.builtin').live_grep() end)
nnoremap('<leader>fw', function() require('telescope.builtin').grep_string() end)
nnoremap('<leader>fh', function() require('telescope.builtin').help_tags() end)
nnoremap('<leader>fc', function() require('telescope.builtin').git_commits() end)
nnoremap('<leader>fb', function() require('telescope.builtin').git_bcommits() end)
nnoremap('<leader>fi', function() require('telescope.builtin').builtin() end)
nnoremap('<leader>.', ':lua dotfiles()<cr>')

function dotfiles()
  require('telescope.builtin').find_files({
    follow = true,
    hidden = true,
    search_dirs = {
      "$HOME/.dotfiles/",
    }
  })
end

----}}}
-- vim-terminator {{{
nnoremap('<leader>ra', ':TerminatorRunAltCmd ')
-- }}}
-- vim-test {{{

nnoremap('<leader>tn', ':TestNearest<CR>')
nnoremap('<leader>ts', ':TestSuite<CR>')
nnoremap('<leader>tf', ':TestFile<CR>')
nnoremap('<leader>tl', ':TestLast<CR>')
nnoremap('<leader>tv', ':TestVisit<CR>')
nnoremap('<leader>tt', ':TestNearest -strategy=neovim<CR>')

--}}}
-- nvim-dap {{{

nnoremap('<F5>',  function() require('dap').continue() end, { silent = true })
-- noremap('<leader>5',  function() require('dap').continue() end, { silent = true })

nnoremap('<F9>',  function() require('dap').toggle_breakpoint() end, { silent = true })
-- noremap('<leader>9',  function() require('dap').toggle_breakpoint() end, { silent = true })

nnoremap('<F10>', function() require('dap').step_over() end, { silent = true })
-- noremap('<leader>0', function() require('dap').step_over() end, { silent = true })

nnoremap('<F11>', function() require('dap').step_into() end, { silent = true })
-- noremap('<leader>-', function() require('dap').step_into() end, { silent = true })

nnoremap('<F12>', function() require('dap').step_out() end, { silent = true })
-- noremap('<leader>=', function() require('dap').step_out() end, { silent = true })

-- UI
nnoremap('<F8>', function() require("dapui").toggle() end, { silent = true })
-- noremap('<leader>8', function() require("dapui").toggle() end, { silent = true })

-- python
nnoremap('<leader>dc', function() require("dap-python").test_class() end, { silent = true })
nnoremap('<leader>dm', function() require("dap-python").test_method() end, { silent = true })
vnoremap('<leader>ds', function() require("dap-python").debug_selection() end, { silent = true })

--}}}
-- vim-easy-align {{{

nnoremap('ga', '<Plug>(EasyAlign)', {})
xnoremap('ga', '<Plug>(EasyAlign)', {})

--}}}
-- Harpoon {{{

nnoremap('<leader>a', function() require('harpoon.mark').add_file() end)
nnoremap('<leader>h', function() require('harpoon.ui').toggle_quick_menu() end, { silent = true })
nnoremap('<leader>1', function() require('harpoon.ui').nav_file(1) end, { silent = true })
nnoremap('<leader>2', function() require('harpoon.ui').nav_file(2) end, { silent = true })
nnoremap('<leader>3', function() require('harpoon.ui').nav_file(3) end, { silent = true })
nnoremap('<leader>4', function() require('harpoon.ui').nav_file(4) end, { silent = true })
nnoremap('<leader>5', function() require('harpoon.ui').nav_file(5) end, { silent = true })
nnoremap('<localleader>1', function() require('harpoon.term').gotoTerminal(1) end, { silent = true })
nnoremap('<localleader>2', function() require('harpoon.term').gotoTerminal(2) end, { silent = true })
nnoremap('<localleader>r', function() require('ewr.plugin_config.harpoon').run_harpoon_cmd_and_navigate() end)

--}}}
-- REST nvim {{{
nnoremap('<leader>rr', function() require('rest-nvim').run() end, {silent = true})
nnoremap('<leader>rp', function() require('rest-nvim').run(true) end, {silent = true})
nnoremap('<leader>rl', function() require('rest-nvim').last() end, {silent = true})
---}}}
-- COC {{{

nnoremap(']g', [[<Plug>(coc-diagnostics-next)]], {})
nnoremap('[g', [[<Plug>(coc-diagnostics-prev)]], {})
nnoremap(']r', [[:CocNext<CR>]], {})
nnoremap('[r', [[:CocPrev<CR>]], {})
nnoremap('gd', [[<Plug>(coc-definition)]], {})
nnoremap('gy', [[<Plug>(coc-type-definition)]], {})
nnoremap('gi', [[<Plug>(coc-implementation)]], {})
nnoremap('gr', [[<Plug>(coc-references)]], {})
nnoremap('<leader>rn', [[<Plug>(coc-rename)]], {})

--function Coc_selection_confirm()
--    if (vim.fn.pumvisible() ~= 0) then
--        vim.cmd([[normal o]])
--        -- vim.fn['coc#on_enter']()
--        --
--    else
--        vim.fn['coc#_select_confirm']()
--    end
--end
--inoremap('<cr>', '<c-o>:lua Coc_selection_confirm()<CR>', {})

inoremap(
    '<cr>',                                 -- TODO: what the hell does this do?
    [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    { expr = true, silent = true }
)

-- }}}
