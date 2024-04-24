local k = require("ewr.keymap")

k.nnoremap("<leader><leader>", "<c-^>", { desc = "Switch to previous buffer" })

-- Changing Window splits
k.nnoremap("<c-h>", ":wincmd h<CR>", { silent = true })
k.nnoremap("<c-j>", ":wincmd j<CR>", { silent = true })
k.nnoremap("<c-k>", ":wincmd k<CR>", { silent = true })
k.nnoremap("<c-l>", ":wincmd l<CR>", { silent = true })
k.tnoremap("<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
k.tnoremap("<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
k.tnoremap("<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
k.tnoremap("<C-^>", [[<C-\><C-n><C-^>l]], { silent = true })
k.tnoremap("<C-o>", [[<C-\><C-n><C-^>l]], { silent = true })
k.tnoremap("<localleader><localleader>", [[<C-\><C-n><C-^>l]], { silent = true })

-- Toggle quickfix
k.nnoremap("<leader>q", ":copen<CR>")
k.nnoremap("<leader>w", ":lopen<CR>") -- "window specific quickfix
k.nnoremap("<leader>c", ":cclose<bar>lclose<bar>TerminatorOutputBufferClose<CR>")

-- Yank to clipboard
if vim.fn.has("mac") == 1 then
	k.vnoremap("<leader>y", '"*y')
	k.nnoremap("<leader>p", '"*p')
else
	k.vnoremap("<leader>y", '"+y')
	k.nnoremap("<leader>p", '"+p')
end

-- Delete without fudging registers
k.vnoremap("<leader>d", '"_d')
k.nnoremap("<leader>d", '"_d')

-- Paste on top of text without fudging registers
k.vnoremap('<leader>p', '"_dP')

-- ThePrimeagen
k.nnoremap("<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
k.nnoremap("Y", "y$")
k.nnoremap("n", "nzzzv")
k.nnoremap("N", "Nzzzv")
k.nnoremap("J", "mzJ`z")
k.inoremap(",", ",<c-g>u")
k.inoremap(".", ".<c-g>u")
k.inoremap("!", "!<c-g>u")
k.inoremap("?", "?<c-g>u")
-- vnoremap('J', [[:m '>+1<CR>gv=gv]])
-- vnoremap('K', [[:m '<-2<CR>gv=gv]])
-- noremap('<leader>j', ':m .+1<CR>==')
-- noremap('<leader>k', ':m .-2<CR>==')

-- Navigation
k.nnoremap("]q", ":cnext<CR>zz")
k.nnoremap("[q", ":cprev<CR>zz")
k.nnoremap("]w", ":lnext<CR>zz")
k.nnoremap("[w", ":lprev<CR>zz")
k.nnoremap("]b", ":bnext<CR>zz")
k.nnoremap("[b", ":bprev<CR>zz")
k.nnoremap("]t", ":tnext<CR>zz")
k.nnoremap("[t", ":tprev<CR>zz")
k.nnoremap("]n", ":next<CR>zz")
k.nnoremap("[n", ":prev<CR>zz")

-- scrolling down with left hand only gives me carpel tunnel
k.nnoremap("<c-y>", "<c-d>")

-- zoom in on dapui buffer in new tab
k.nnoremap("<c-t>", ":tabnew %<CR>")

-- Scroll split emacs style
k.nnoremap("<c-m-f>", "<c-w><c-w><c-d><c-w><c-w>")
k.nnoremap("<c-m-b>", "<c-w><c-w><c-u><c-w><c-w>")

-- Resize windows
k.nnoremap("<Left>", ":vertical resize -2<CR>")
k.nnoremap("<Right>", ":vertical resize +2<CR>")
k.nnoremap("<Up>", ":resize -2<CR>")
k.nnoremap("<Down>", ":resize +2<CR>")

k.nnoremap("<leader>ir", function()
	local start = vim.fn.input("start: ")
	local stop = vim.fn.input("stop: ")
	local step = vim.fn.input("[step]: ")
	if step == "" then
		step = "1"
	end
	local list = {}
	for i = start, stop, step do
		table.insert(list, i)
	end
	local array = "[" .. table.concat(list, ", ") .. "]"
	vim.cmd("normal a" .. array)
end, { desc = "Insert a range using start, stop, step" })

-- Trim Whitespace of current file
function Trim_whitespace()
	local save = vim.fn.winsaveview()
	vim.cmd([[keeppatterns %s/\s\+$//e]])
	vim.fn.winrestview(save)
end

-- Add comment to end of line
k.nnoremap("<leader>-", [[80A-<ESC>81<BAR>d$_<CR>]], { silent = true })
k.nnoremap("<leader>_", [[50A-<ESC>51<BAR>d$_<CR>]], { silent = true })

-- Grep word
k.nnoremap("<leader>gw", [[:Ggrep -q -I "\<C-r><C-w>\>" .<CR>]], { silent = true })
k.nnoremap("<leader>psw", [[:cfdo %s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
k.nnoremap("<leader>pwu", [[:cfdo normal u]])

-- keymap.nnoremap('<leader>,', [[:'<,'>s/,/,\r/g ]], {});
k.nnoremap("<leader>,", function()
	local line1 = vim.api.nvim_buf_get_mark(0, "<")[1]
	local line2 = vim.api.nvim_buf_get_mark(0, ">")[1]

	print(vim.inspect(line1))
	print(vim.inspect(line2))
	-- local repl = vim.fn.substitute(line, '\a', "*", "g")
	-- vim.fn.setline(".", repl)
end, {})

-- keymap.nnoremap('<leader>db', [[:%DB<CR>]]);
k.nnoremap("<leader>db", [[vip:DB<CR>]])
k.vnoremap("<leader>db", [[:DB<CR>]])
