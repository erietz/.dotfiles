vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('ewr.plugins')
require('ewr.mappings')
require('ewr.options')

require('plugin.lspconfig')
require('plugin.telescope')

-- Fix LSP being loaded before colorscheme?
vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
