local keymap = require("ewr.keymap")

keymap.nnoremap('<leader>rr', function() require('rest-nvim').run() end, {silent = true})
keymap.nnoremap('<leader>rp', function() require('rest-nvim').run(true) end, {silent = true})
keymap.nnoremap('<leader>rl', function() require('rest-nvim').last() end, {silent = true})
