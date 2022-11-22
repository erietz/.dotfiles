local keymap = require("ewr.keymap")

keymap.nnoremap('<leader>dv', ':NvimTreeToggle<CR>',
    { desc = "View tree of project" })

keymap.nnoremap('<leader>fv', ':NvimTreeFindFile<CR>',
    { desc = "View tree of current file" })

