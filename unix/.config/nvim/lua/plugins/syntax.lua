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
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.completion.spell,
					require("none-ls.diagnostics.eslint"),
					-- null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.diagnostics.mypy,
					-- null_ls.builtins.diagnostics.ruff,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
	"lukas-reineke/indent-blankline.nvim", -- reading yaml indented 2 spaces...

}
