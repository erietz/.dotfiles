local keymap = require("ewr.keymap")

require("rest-nvim").setup({
    result_split_horizontal = false,
    skip_ssl_verification = false,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    jump_to_request = false,
    result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = false,
        show_http_info = false,
        show_headers = false,
    },
})

keymap.nnoremap('<leader>rr', function()
    require('rest-nvim').run()
end, { silent = true, desc = "rest-nvim: Run HTTP request" })

keymap.nnoremap('<leader>rp', function()
    require('rest-nvim').run(true)
end, { silent = true, desc = "rest-nvim: View parse curl command" })

keymap.nnoremap('<leader>rl', function()
    require('rest-nvim').last()
end, { silent = true, desc = "rest-nvim: Run last HTTP request" })
