local function get_background()
	local background = vim.env.BACKGROUND or vim.g.background or "dark"
	if background == "light" then
		return "light"
	else
		return "dark"
	end
end

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
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		dir = "/Users/ethan/git/hub/chill.nvim",
		name = "chill",
		lazy = false,
		priority = 1000,
		config = function()
			local background = get_background()
			require('chill').setup({
				variant = background, -- 'dark' or 'light'
				contrast = 'normal', -- 'high' or 'normal'
				transparent = false, -- Enable transparent background
				italics = true, -- Use italics for comments and certain syntax
				dim_inactive = false, -- Dim inactive windows
			})
			vim.cmd.colorscheme 'chill'
		end
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					functions = "italic,bold",
					variables = "italic",
					conditionals = "italic",
					operators = "bold",
				},
			})

			local background = get_background()
			if background == "light" then
				vim.cmd([[colorscheme dayfox]])
			else
				vim.cmd([[colorscheme nightfox]])
			end
		end,
	},
	"junegunn/seoul256.vim",
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			transparent = false,
			dimInactive = true,
		},
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
			vim.cmd([[colorscheme catppuccin-frappe]])
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
		"ishan9299/nvim-solarized-lua",
		lazy = true,
		priority = 1000,
		config = function()
			-- vim.g.solarized_italics = 1
			-- vim.g.solarized_visibility = "high"
			-- vim.g.solarized_diffmode = "normal"
			-- vim.g.solarized_termtrans = 1
			-- vim.g.solarized_borders = 1
			-- vim.g.solarized_contrast = "high"
			-- vim.g.solarized_underline = 1
			vim.opt.background = "light"
			vim.cmd([[colorscheme solarized]])
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
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
	{
		"google/vim-colorscheme-primary",
		lazy = true,
		priority = 1000,
		config = function()
			vim.opt.background = "light"
			vim.cmd([[colorscheme primary]])
		end,
	},
}
