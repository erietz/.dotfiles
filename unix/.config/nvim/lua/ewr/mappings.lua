local keymap = require("ewr.keymap")

keymap.nnoremap('<leader><leader>', '<c-^>',
    { desc = "Switch to previous buffer" })

-- Changing Window splits
keymap.nnoremap('<c-h>', ':wincmd h<CR>', { silent = true })
keymap.nnoremap('<c-j>', ':wincmd j<CR>', { silent = true })
keymap.nnoremap('<c-k>', ':wincmd k<CR>', { silent = true })
keymap.nnoremap('<c-l>', ':wincmd l<CR>', { silent = true })
keymap.tnoremap('<C-h>', [[<C-\><C-n><C-w>h]], { silent = true })
keymap.tnoremap('<C-j>', [[<C-\><C-n><C-w>j]], { silent = true })
keymap.tnoremap('<C-k>', [[<C-\><C-n><C-w>k]], { silent = true })
keymap.tnoremap('<C-^>', [[<C-\><C-n><C-^>l]], { silent = true })
keymap.tnoremap('<C-o>', [[<C-\><C-n><C-^>l]], { silent = true })
keymap.tnoremap('<localleader><localleader>', [[<C-\><C-n><C-^>l]], { silent = true })

-- Toggle quickfix
keymap.nnoremap('<leader>q', ':copen<CR>')
keymap.nnoremap('<leader>w', ':lopen<CR>')    -- "window specific quickfix
keymap.nnoremap('<leader>c', ':cclose<bar>lclose<bar>TerminatorOutputBufferClose<CR>')

-- Yank to clipboard
if vim.fn.has('mac') == 1 then
  keymap.vnoremap('<leader>y', '"*y')
  keymap.nnoremap('<leader>p', '"*p')
else
  keymap.vnoremap('<leader>y', '"+y')
  keymap.nnoremap('<leader>p', '"+p')
end

-- Delete without fudging registers
keymap.vnoremap('<leader>d', '"_d')
keymap.nnoremap('<leader>d', '"_d')

-- ThePrimeagen
keymap.nnoremap('<leader>sw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.nnoremap('Y', 'y$')
keymap.nnoremap('n', 'nzzzv')
keymap.nnoremap('N', 'Nzzzv')
keymap.nnoremap('J', 'mzJ`z')
keymap.inoremap(',', ',<c-g>u')
keymap.inoremap('.', '.<c-g>u')
keymap.inoremap('!', '!<c-g>u')
keymap.inoremap('?', '?<c-g>u')
-- vnoremap('J', [[:m '>+1<CR>gv=gv]])
-- vnoremap('K', [[:m '<-2<CR>gv=gv]])
-- noremap('<leader>j', ':m .+1<CR>==')
-- noremap('<leader>k', ':m .-2<CR>==')

-- Navigation
keymap.nnoremap(']q', ':cnext<CR>zz')
keymap.nnoremap('[q', ':cprev<CR>zz')
keymap.nnoremap(']w',   ':lnext<CR>zz')
keymap.nnoremap('[w', ':lprev<CR>zz')
keymap.nnoremap(']b', ':bnext<CR>zz')
keymap.nnoremap('[b', ':bprev<CR>zz')
keymap.nnoremap(']t', ':tnext<CR>zz')
keymap.nnoremap('[t', ':tprev<CR>zz')
keymap.nnoremap(']n', ':next<CR>zz')
keymap.nnoremap('[n', ':prev<CR>zz')

-- scrolling down with left hand only gives me carpel tunnel
keymap.nnoremap('<c-y>', '<c-d>')

-- zoom in on dapui buffer in new tab
keymap.nnoremap('<c-t>', ':tabnew %<CR>')

-- Scroll split emacs style
keymap.nnoremap('<c-m-f>', '<c-w><c-w><c-d><c-w><c-w>')
keymap.nnoremap('<c-m-b>', '<c-w><c-w><c-u><c-w><c-w>')

-- Resize windows
keymap.nnoremap('<Left>', ':vertical resize -2<CR>')
keymap.nnoremap('<Right>', ':vertical resize +2<CR>')
keymap.nnoremap('<Up>', ':resize -2<CR>')
keymap.nnoremap('<Down>', ':resize +2<CR>')

keymap.nnoremap('<leader>ir', function()
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
  local array =  '[' .. table.concat(list, ', ') .. ']'
  vim.cmd('normal a' .. array)
end,
    { desc = "Insert a range using start, stop, step" }
)

-- Trim Whitespace of current file
function Trim_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

-- Add comment to end of line
keymap.nnoremap('<leader>-', [[80A-<ESC>81<BAR>d$_<CR>]], { silent = true })
keymap.nnoremap('<leader>_', [[50A-<ESC>51<BAR>d$_<CR>]], { silent = true })

-- Grep word
-- noremap('<leader>gw', [[:Ggrep -q -I "\<C-r><C-w>\>" .<CR>]], { silent = true })
keymap.nnoremap('<leader>psw', [[:cfdo %s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.nnoremap('<leader>pwu', [[:cfdo normal u]])

-- LSP
keymap.nnoremap('<leader>e', vim.diagnostic.open_float, { silent = true })
keymap.nnoremap('[d', vim.diagnostic.goto_prev, { silent = true })
keymap.nnoremap(']d', vim.diagnostic.goto_next, { silent = true })
keymap.nnoremap('<leader>l', vim.diagnostic.setloclist, { silent = true })
