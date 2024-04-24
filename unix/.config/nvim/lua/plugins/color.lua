return {
	{
		"erietz/set3.nvim",
		dependencies = "tjdevries/colorbuddy.nvim",
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"css",
			"javascript",
			"html",
			"i3config",
		},
	},
	"gruvbox-community/gruvbox",
	"EdenEast/nightfox.nvim",
	"catppuccin/nvim",
	"junegunn/seoul256.vim",
	"rebelot/kanagawa.nvim",
	"neanias/everforest-nvim",
	"EdenEast/nightfox.nvim",
	{ 'kepano/flexoki-neovim', name = 'flexoki' },
	{
		"ntk148v/habamax.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"nvim-lualine/lualine.nvim",
		disable = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			lazy = true,
		},
		config = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	-- Using lazy.nvim
	{
		'ribru17/bamboo.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('bamboo').setup {
				-- optional configuration here
			}
			require('bamboo').load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine"
	}
}
