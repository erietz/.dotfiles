return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'nvim-treesitter/playground',
		dependencies = 'nvim-treesitter/nvim-treesitter'
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter'
	},
}
