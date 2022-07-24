local keymap = require("ewr.keymap")

vim.cmd([[ autocmd Filetype markdown let b:dispatch = 'pandoc % -o %:r' . '.pdf']])
vim.cmd([[ autocmd Filetype cs let b:dispatch = 'dotnet test']])

-- Dispatch
keymap.nnoremap('<leader>mr', ':Make run<CR>', { silent = true })
keymap.nnoremap('<leader>mb', ':Make build<CR>', { silent = true })
keymap.nnoremap('<leader>mt', ':Make test<CR>', { silent = true })
keymap.nnoremap('<leader>mc', ':Make clean<CR>', { silent = true })

