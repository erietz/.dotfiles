-- Install packer.nvim if not already installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local no_packer = not vim.loop.fs_stat(packer_path)
if no_packer then
    print('Installing packer...')
    vim.fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        packer_path
    })
end

-- leader key and other options should be set before plugins
require('ewr.options')
require('ewr.plugins')

-- The :PackerSync command only exists after require('packer').startup() has
-- been called
if no_packer then
	vim.cmd('PackerSync')
end

require('ewr.mappings')
require('ewr.colors')
if vim.fn.has('win32') == 1 then
    require('ewr.windows')
end
