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
require('ewr.mappings')
require('ewr.options')

require('plugin.lspconfig')
require('plugin.telescope')

-- Fix LSP being loaded before colorscheme?
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
