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
			local sources = {
				null_ls.builtins.completion.spell,
				-- null_ls.builtins.formatting.prettierd,
				-- null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.stylua,
			}

			if vim.fn.executable("node") == 1 then
				table.insert(sources, require("none-ls.diagnostics.eslint"))
				table.insert(sources, null_ls.builtins.formatting.prettier)
			end

			null_ls.setup({
				sources = sources,
			})
		end,
	},
	"lukas-reineke/indent-blankline.nvim", -- reading yaml indented 2 spaces...
}
