local keymap = require("ewr.keymap")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

keymap.nnoremap('<leader>dv', ':Ex<CR>', { desc = "View tree of project" })
