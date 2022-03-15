vim.opt.termguicolors = true    -- Better colors
vim.opt.background = "dark"    -- Sets theme below

-- vim.env.BAT_THEME = "ansi"
if vim.api.nvim_get_option("background") == "dark" then
    vim.g.gruvbox_contrast_dark = "hard"
    vim.cmd("colorscheme gruvbox")
else
    vim.cmd("colorscheme PaperColor")
end
