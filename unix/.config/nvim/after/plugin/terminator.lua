local keymap = require("ewr.keymap")

vim.g.terminator_auto_shrink_output = 1
vim.g.terminator_repl_delimiter_regex = "--"

vim.g.terminator_runfile_map = {
	sh = "bash",
	scheme = "racket",
	cs = "dotnet run",
	python = "python3 -u",
	typescript = "npx ts-node",
}

vim.g.terminator_repl_command = {
	sql = "mysql -u ethan -p",
	typescript = "npx ts-node",
}

keymap.nnoremap("<leader>ra", ":TerminatorRunAltCmd ")
keymap.nnoremap("<leader>oo", ":TerminatorOutputBufferToggle<CR>")
