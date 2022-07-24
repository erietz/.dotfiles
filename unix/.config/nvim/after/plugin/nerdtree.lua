local keymap = require("ewr.keymap")

if vim.fn.exists(':NERDTreeWinSize') then
    vim.g.NERDTreeWinSize = 25
end

keymap.nnoremap('<leader>dv', ':NERDTreeToggle<CR>',
    { desc = "View tree of project" })

keymap.nnoremap('<leader>fv', ':NERDTreeFind<CR>',
    { desc = "View tree of current file" })

