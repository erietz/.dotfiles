local priority = 1000

-- local function is_sunny_outside()
-- 	local now = os.date("*t")
-- 	return now.hour >= 7 and now.hour < 18
-- end

local function is_sunny_outside()
	local theme = vim.fn.systemlist("defaults read -g AppleInterfaceStyle 2>/dev/null")[1]
	if theme == "Dark" then
		return false
	else
		return true
	end
end

--- Determine background based on preference or time of day
--- @return "light" | "dark"
local function get_background()
	local background = vim.env.BACKGROUND or vim.g.background
	if background == "light" then
		return "light"
	elseif background == "dark" then
		return "dark"
	else
		if is_sunny_outside() then
			return "light"
		else
			return "dark"
		end
	end
end

return {
	{
		"junegunn/seoul256.vim",
		lazy = false,
		priority = priority,
		config = function()
			if get_background() == "light" then
				vim.g.seoul256_background = 256
				vim.cmd("colorscheme seoul256-light")
			else
				vim.g.seoul256_background = "dark"
				vim.cmd("colorscheme seoul256")
			end
		end,
	},
	{
		"gruvbox-community/gruvbox",
		lazy = true,
		priority = priority,
		config = function()
			if get_background() == "light" then
				vim.g.gruvbox_contrast_light = "hard"
				vim.cmd("colorscheme gruvbox")
			else
				vim.g.gruvbox_contrast_dark = "soft"
				vim.cmd("colorscheme gruvbox")
			end
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = priority,
		config = function()
			if get_background() == "light" then
				require("tokyonight").setup({
					style = "day",
					transparent = false,
				})
				vim.cmd("colorscheme tokyonight")
			else
				require("tokyonight").setup({
					style = "night",
					transparent = false,
				})
				vim.cmd("colorscheme tokyonight")
			end
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = priority,
		config = function()
			if get_background() == "light" then
				vim.cmd("colorscheme rose-pine")
				vim.g.rose_pine_variant = "dawn"
			else
				vim.cmd("colorscheme rose-pine")
				vim.g.rose_pine_variant = "moon"
			end
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = priority,
		config = function()
			if get_background() == "light" then
				require("catppuccin").setup({ flavour = "latte" })
				vim.cmd("colorscheme catppuccin")
			else
				require("catppuccin").setup({ flavour = "frappe" })
				vim.cmd("colorscheme catppuccin")
			end
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = priority,
		config = function()
			if get_background() == "light" then
				require("kanagawa").setup({
					transparent = false,
					theme = "light",
				})
				vim.cmd("colorscheme kanagawa")
			else
				require("kanagawa").setup({
					transparent = false,
					theme = "wave",
				})
				vim.cmd("colorscheme kanagawa")
			end
		end,
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
	{ "EdenEast/nightfox.nvim" }, -- lazy
}
