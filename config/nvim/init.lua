--[[
          __                                   __  __
    _____/ /_  ____ __________  ___  ____     / /_/ /_  ___     ____ __  _____
   / ___/ __ \/ __ `/ ___/ __ \/ _ \/ __ \   / __/ __ \/ _ \   / __ `/ |/_/ _ \
  (__  ) / / / /_/ / /  / /_/ /  __/ / / /  / /_/ / / /  __/  / /_/ />  </  __/
 /____/_/ /_/\__,_/_/  / .___/\___/_/ /_/   \__/_/ /_/\___/   \__,_/_/|_|\___/
                      /_/
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('Installing packer...')
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.api.nvim_command 'packadd packer.nvim'
end

require('ewr.plugins')
require('ewr.options')
require('ewr.mappings')

-- load all lua files in lua/plugin/*
local path = fn.stdpath('config') .. '/lua/plugin/'
local files = fn.glob('lua/plugin/*', 0, 1) -- third argument for returning list
for _, file in pairs(files) do
  local file = 'plugin.' .. fn.fnamemodify(file, ":t:r")
  require(file)
end

require('plugin.treesitter')  -- Needs to be loaded after other stuff

-- Fix LSP being loaded before colorscheme?
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
