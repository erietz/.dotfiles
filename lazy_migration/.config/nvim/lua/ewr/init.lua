local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- leader key and other options should be set before plugins
require('ewr.options')
require("lazy").setup("plugins")
require('ewr.mappings')
require('ewr.colors')
if vim.fn.has('win32') == 1 then
    require('ewr.windows')
end
