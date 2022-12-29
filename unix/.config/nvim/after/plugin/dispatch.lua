local keymap = require("ewr.keymap")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.b.dispatch = 'pandoc % -o %:r' .. '.pdf'
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function()
        vim.b.dispatch = 'dotnet test'
    end
})

-- Dispatch
keymap.nnoremap('<leader>mr', ':Make run<CR>', { silent = true })
keymap.nnoremap('<leader>mb', ':Make build<CR>', { silent = true })
keymap.nnoremap('<leader>mt', ':Make test<CR>', { silent = true })
keymap.nnoremap('<leader>mc', ':Make clean<CR>', { silent = true })

