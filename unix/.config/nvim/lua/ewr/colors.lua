vim.opt.termguicolors = true    -- Better colors
vim.opt.background = "dark"    -- Sets theme below

-- vim.env.BAT_THEME = "ansi"
if vim.api.nvim_get_option("background") == "dark" then
    -- vim.g.gruvbox_contrast_dark = "soft"
    vim.cmd("colorscheme gruvbox")
    -- vim.g.seoul256_background = 236
    -- vim.cmd("colorscheme seoul256")
else
    vim.cmd("colorscheme PaperColor")
end
