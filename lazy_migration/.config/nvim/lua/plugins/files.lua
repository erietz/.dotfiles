return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-dap.nvim',
				config = function()
					require('telescope').load_extension('dap')
				end
			},
		}
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
		config = function()
			require("nvim-tree").setup()
		end
	},
	{
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
	},
}
