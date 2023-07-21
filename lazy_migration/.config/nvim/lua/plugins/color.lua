return {
	{
		'erietz/set3.nvim',
		dependencies = 'tjdevries/colorbuddy.nvim'
	},
	'norcalli/nvim-colorizer.lua',
	'gruvbox-community/gruvbox',
	'junegunn/seoul256.vim',
	"rebelot/kanagawa.nvim",
	"neanias/everforest-nvim",
	{
		'nvim-lualine/lualine.nvim',
		disable = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			lazy = true
		},
		config = function() require('lualine').setup {} end
	},
}
