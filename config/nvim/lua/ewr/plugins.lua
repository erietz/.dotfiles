-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use 'morhetz/gruvbox'
    use {
  	  'nvim-telescope/telescope.nvim',
  	  requires = {
		    {'nvim-lua/popup.nvim'},
		    {'nvim-lua/plenary.nvim'}
	    }
    }
    use {'erietz/vim-terminator'}
end
)
