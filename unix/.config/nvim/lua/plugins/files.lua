return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons", -- optional, for file icons
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
	},
}
