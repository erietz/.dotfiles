-- Install packer.nvim if not already installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local no_packer = vim.fn.empty(vim.fn.glob(install_path))
if no_packer > 0 then
    print('Installing packer...')
    vim.fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

require('ewr.options')
require('ewr.plugins')
-- The :PackerSync command only exists after require('packer').startup() has
-- been called
if no_packer > 0 then vim.cmd('PackerSync') end
require('ewr.mappings')
require('ewr.colors')
if vim.fn.has('win32') == 1 then
    require('ewr.windows')
end

-- load all lua files in lua/ewr/plugin_config
local module_path = vim.fn.stdpath('config') .. '/lua/ewr/plugin_config/'
for _, file in pairs(vim.fn.glob(module_path .. '*', 0, 1)) do
    local modname = 'ewr.plugin_config.' .. vim.fn.fnamemodify(file, ":t:r")
    require(modname)
end