return {
	-- language support
	"lervag/vimtex",
	"editorconfig/editorconfig-vim",
	"neoclide/jsonc.vim",
	"erietz/vim-todo",
	"erietz/vim-doconce",
	"bfrg/vim-jq",
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	"lukas-reineke/indent-blankline.nvim", -- reading yaml indented 2 spaces...
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
}
