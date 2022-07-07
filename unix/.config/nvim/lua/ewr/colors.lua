vim.opt.termguicolors = true    -- Better colors
vim.opt.background = "dark"     -- Sets theme below

function Set_colorscheme()
    if vim.api.nvim_get_option("background") == "dark" then
        vim.g.gruvbox_contrast_dark = "soft"
        vim.cmd("colorscheme gruvbox")
        -- vim.cmd("colorscheme xcodewwdc")
        -- vim.cmd("colorscheme solarized8")
    else
        vim.cmd("colorscheme PaperColor")
    end
end

Set_colorscheme()
