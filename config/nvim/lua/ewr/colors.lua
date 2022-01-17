vim.opt.termguicolors = true    -- Better colors
vim.opt.background = "dark"    -- Sets theme below

if vim.api.nvim_get_option("background") == "dark" then
    -- vim.cmd("colorscheme gruvbox")
    vim.cmd("colorscheme base16-eighties")
    vim.env.BAT_THEME = "gruvbox-dark"
else
    vim.cmd("colorscheme gruvbox")
    vim.env.BAT_THEME = "gruvbox-light"
end
