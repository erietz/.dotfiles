--------------------------------------------------------------------------------
-- Author      : Ethan Rietz
-- Date        : 2021-07-23
-- Description : Primary neovim config file
--------------------------------------------------------------------------------

local fn = vim.fn

-- Install packer.nvim if not already installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local no_packer = fn.empty(fn.glob(install_path))
if no_packer > 0 then
    print('Installing packer...')
    packer_bootstrap = fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

require('ewr.options')
require('ewr.plugins')
-- The :PackerSync command only exists after require('packer').startup(....)
if no_packer > 0 then vim.cmd('PackerSync') end
require('ewr.mappings')
require('ewr.colors')
if vim.fn.has('win32') == 1 then
    require('ewr.windows')
end

-- load all lua files in lua/plugin/*
local module_path = fn.stdpath('config') .. '/lua/plugin/'
local files = fn.glob(module_path .. '*', 0, 1)
for _, file in pairs(files) do
    local filepath = 'plugin.' .. fn.fnamemodify(file, ":t:r")
    require(filepath)
end
