vim.opt.termguicolors = true    -- Better colors
vim.opt.background = "light"    -- Sets theme below

if vim.api.nvim_get_option("background") == "dark" then
    vim.cmd("colorscheme base16-gruvbox-dark-soft")
    vim.env.BAT_THEME = "gruvbox-dark"
else
    vim.cmd("colorscheme base16-solarized-light")
    vim.env.BAT_THEME = "Solarized (light)"
end
