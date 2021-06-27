vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('Installing packer...')
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require('ewr.plugins')
require('ewr.options')
require('ewr.mappings')

<<<<<<< HEAD

--[[
strFiles = vim.fn.glob('lua/plugin/*')
files = {}
for file in strFiles:gmatch('[^\n]+') do
  table.insert(files, file)
end
--]]

=======
-- TODO: load all lua/plugin/* by glob or manual loading?
>>>>>>> 45b91c6c887cbf30959b3080027c1e187740f52a
require('plugin.lspconfig')
require('plugin.telescope')
require('plugin.terminator')

-- TODO this should be set in lua/plugin/colorizer.lua
require('colorizer').setup({'css', 'javascript', 'html', 'i3config'})

-- Fix LSP being loaded before colorscheme?
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])


-- Ultisnips
vim.g.UltiSnipsSnippetsDir = fn.stdpath('config').."/UltiSnips/"
vim.g.UltiSnipsExpandTrigger = "<c-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsListSnippets = "<c-h>"
--vim.g.UltiSnipsSnippetDirectories = {"[/home/ethan/.vim/UltiSnips]"}

