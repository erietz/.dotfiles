local keymap = require("ewr.keymap")

keymap.nnoremap('<leader>dv', ':NvimTreeToggle<CR>',
    { desc = "View tree of project" })

keymap.nnoremap('<leader>fv', ':NvimTreeFindFile<CR>',
    { desc = "View tree of current file" })

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
-- keymap.nnoremap('<leader>dv', ':Ex<CR>', { desc = "View tree of project" })
