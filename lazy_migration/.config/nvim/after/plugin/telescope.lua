local keymap = require("ewr.keymap")
local action_layout = require("telescope.actions.layout")

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<c-k>"] = action_layout.toggle_preview
            },
            i = {
                ["<c-k>"] = action_layout.toggle_preview
            },
        }
    }
})

keymap.nnoremap('<leader>ff', function()
    require('telescope.builtin').find_files()
end, { desc = "Telescope: find files" })

keymap.nnoremap('<leader><Tab>', function()
    require('telescope.builtin').buffers()
end, { desc = "Telescope: find buffers" })

keymap.nnoremap('<c-p>', function()
    require('telescope.builtin').git_files()
end, { desc = "Telescope: find git files" })

keymap.nnoremap('<leader>fg', function()
    require('telescope.builtin').live_grep()
end, { desc = "Telescope: Live grep" })

keymap.nnoremap('<leader>fw', function()
    require('telescope.builtin').grep_string()
end, { desc = "Telescope: Grep string under cursor" })

keymap.nnoremap('<leader>fh', function()
    require('telescope.builtin').help_tags()
end, { desc = "Telescope: find help tags" })

keymap.nnoremap('<leader>fc', function()
    require('telescope.builtin').git_commits()
end, { desc = "Telescope: find git commits for current repo" })

keymap.nnoremap('<leader>fb', function()
    require('telescope.builtin').git_bcommits()
end, { desc = "Telescope: find git commits for current buffer" })

keymap.nnoremap('<leader>fi', function()
    require('telescope.builtin').builtin()
end, { desc = "Telescope: search telescope built in functions" })

keymap.nnoremap('<leader>fk', function()
    require('telescope.builtin').keymaps()
end, { desc = "Telescope: search normal mode key mappings" })

keymap.nnoremap('<leader>.', function()
    require('telescope.builtin').find_files({
        find_command = { "fd", "--type", "f"},
        follow = true,
        hidden = true,
        search_dirs = { "$HOME/.dotfiles/" }
    })
end, { desc = "Telescope: find through my dotfiles" })
