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
	{
		"gruvbox-community/gruvbox",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	"EdenEast/nightfox.nvim",
	"catppuccin/nvim",
	"junegunn/seoul256.vim",
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"phha/zenburn.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("zenburn").setup()
		end,
	},
	"neanias/everforest-nvim",
	"EdenEast/nightfox.nvim",
	{ "kepano/flexoki-neovim", name = "flexoki" },
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
		lazy = true,
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-latte]])
		end,
	},
	-- Using lazy.nvim
	{
		"ribru17/bamboo.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- optional configuration here
			})
			require("bamboo").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = false,
			})
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_light")
		end,
	},
}
