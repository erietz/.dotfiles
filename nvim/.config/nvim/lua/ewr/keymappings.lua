vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "Switch to previous buffer" })

-- Changing Window splits
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
vim.keymap.set("t", "<C-^>", [[<C-\><C-n><C-^>l]], { silent = true })
vim.keymap.set("t", "<C-o>", [[<C-\><C-n><C-^>l]], { silent = true })
vim.keymap.set("t", "<localleader><localleader>", [[<C-\><C-n><C-^>l]], { silent = true })

-- Toggle quickfix
vim.keymap.set("n", "<leader>q", ":copen<CR>")
vim.keymap.set("n", "<leader>w", ":lopen<CR>") -- "window specific quickfix
vim.keymap.set("n", "<leader>c", ":cclose<bar>lclose<CR>")

-- Yank to clipboard
if vim.fn.has("mac") == 1 then
	vim.keymap.set("v", "<leader>y", '"*y')
	vim.keymap.set("n", "<leader>p", '"*p')
else
	vim.keymap.set("v", "<leader>y", '"+y')
	vim.keymap.set("n", "<leader>p", '"+p')
end

-- Delete without fudging registers
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>d", '"_d')

-- Paste on top of text without fudging registers
vim.keymap.set("v", "<leader>p", '"_dP')

-- ThePrimeagen
vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
-- vnoremap('J', [[:m '>+1<CR>gv=gv]])
-- vnoremap('K', [[:m '<-2<CR>gv=gv]])
-- noremap('<leader>j', ':m .+1<CR>==')
-- noremap('<leader>k', ':m .-2<CR>==')

-- Navigation
vim.keymap.set("n", "]q", ":cnext<CR>zz")
vim.keymap.set("n", "[q", ":cprev<CR>zz")
vim.keymap.set("n", "]w", ":lnext<CR>zz")
vim.keymap.set("n", "[w", ":lprev<CR>zz")
vim.keymap.set("n", "]b", ":bnext<CR>zz")
vim.keymap.set("n", "[b", ":bprev<CR>zz")
vim.keymap.set("n", "]t", ":tnext<CR>zz")
vim.keymap.set("n", "[t", ":tprev<CR>zz")
vim.keymap.set("n", "]n", ":next<CR>zz")
vim.keymap.set("n", "[n", ":prev<CR>zz")

-- scrolling down with left hand only gives me carpel tunnel
vim.keymap.set("n", "<c-y>", "<c-d>")

-- zoom in on dapui buffer in new tab
vim.keymap.set("n", "<c-t>", ":tabnew %<CR>")

-- Scroll split emacs style
vim.keymap.set("n", "<c-m-f>", "<c-w><c-w><c-d><c-w><c-w>")
vim.keymap.set("n", "<c-m-b>", "<c-w><c-w><c-u><c-w><c-w>")

-- Resize windows
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<Up>", ":resize -2<CR>")
vim.keymap.set("n", "<Down>", ":resize +2<CR>")

vim.keymap.set("n", "<leader>ir", function()
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
vim.keymap.set("n", "<leader>-", [[80A-<ESC>81<BAR>d$_<CR>]], { silent = true })
vim.keymap.set("n", "<leader>_", [[50A-<ESC>51<BAR>d$_<CR>]], { silent = true })

-- Grep word
vim.keymap.set("n", "<leader>gwp", [[:Ggrep -q -I <C-r><C-w> .<CR>]], { silent = false })
vim.keymap.set("n", "<leader>gwf", [[:Ggrep -q -I <C-r><C-w> %<CR>]], { silent = false })
vim.keymap.set("n", "<leader>psw", [[:cfdo %s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>pwu", [[:cfdo normal u]])

-- keymap.nnoremap('<leader>,', [[:'<,'>s/,/,\r/g ]], {});
vim.keymap.set("n", "<leader>,", function()
	local line1 = vim.api.nvim_buf_get_mark(0, "<")[1]
	local line2 = vim.api.nvim_buf_get_mark(0, ">")[1]

	print(vim.inspect(line1))
	print(vim.inspect(line2))
	-- local repl = vim.fn.substitute(line, '\a', "*", "g")
	-- vim.fn.setline(".", repl)
end, {})

-- keymap.nnoremap('<leader>db', [[:%DB<CR>]]);
vim.keymap.set("n", "<leader>db", [[vip:DB<CR>]])
vim.keymap.set("v", "<leader>db", [[:DB<CR>]])

function Scratch()
	if vim.fn.bufexists("scratch") == 1 then
		vim.cmd(":e scratch")
	else
		vim.cmd([[
			split
			noswapfile hide enew
			setlocal buftype=nofile
			setlocal bufhidden=hide
			"setlocal nobuflisted
			"lcd ~
			file scratch
		]])
	end
end

vim.api.nvim_create_user_command("Scratch", Scratch, {})

function SearchToQuickfix()
	local pattern = vim.fn.getreg("/")
	if pattern == "" then
		print("No search pattern")
		return
	end

	vim.cmd("vimgrep /" .. pattern .. "/j %")
	vim.cmd("copen")
end

vim.keymap.set("n", "<leader>/", SearchToQuickfix, { desc = "Search to quickfix" })
