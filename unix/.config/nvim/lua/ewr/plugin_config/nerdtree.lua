local keymap = require("ewr.keymap")

keymap.nnoremap('<leader>dv', ':NERDTreeToggle<CR>',
    { desc = "View tree of project" })

keymap.nnoremap('<leader>fv', ':NERDTreeFind<CR>',
    { desc = "View tree of current file" })

