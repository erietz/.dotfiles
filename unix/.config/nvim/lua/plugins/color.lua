return {
	{
		'erietz/set3.nvim',
		dependencies = 'tjdevries/colorbuddy.nvim'
	},
	{
		'norcalli/nvim-colorizer.lua',
		opts = {
			'css',
			'javascript',
			'html',
			'i3config'
		}
	},
	'gruvbox-community/gruvbox',
	'junegunn/seoul256.vim',
	"rebelot/kanagawa.nvim",
	"neanias/everforest-nvim",
	"EdenEast/nightfox.nvim",
	{
		'nvim-lualine/lualine.nvim',
		disable = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			lazy = true
		},
		config = true
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
}
