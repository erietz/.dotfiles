local keymap = require("ewr.keymap")

vim.g["test#strategy"] = "dispatch"
vim.cmd([[let test#python#pytest#options = '-rA -v']])

-- vim.g['dispatch_compilers'] = {
--     ["python"] = "",
--     ["pytest"] = "pytest"
-- }

keymap.nnoremap("<leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })

keymap.nnoremap("<leader>ts", ":TestSuite<CR>", { desc = "Test suite" })

keymap.nnoremap("<leader>tf", ":TestFile<CR>", { desc = "Test current file" })

keymap.nnoremap("<leader>tl", ":TestLast<CR>", { desc = "Test last" })

keymap.nnoremap("<leader>tv", ":TestVisit<CR>", { desc = "Test visit" })

keymap.nnoremap("<leader>tt", ":TestNearest -strategy=neovim<CR>", { desc = "Test nearest using neovim terminal" })
