-- vim.g.netrw_liststyle = 3   -- default view is tree
vim.g.netrw_banner = 0      -- no nasty banner at top
vim.g.netrw_split = 4       -- open files in previous window
vim.g.netrw_winsize = 25    -- take up 25% of the window
vim.g.netrw_keepdir = 0     -- change cwd while navigating

if vim.fn.exists(':NERDTreeWinSize') then
    vim.g.NERDTreeWinSize = 25
end
