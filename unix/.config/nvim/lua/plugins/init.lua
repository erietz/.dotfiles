-- misc plugins with no particular classification

return {
	{
		"NTBBloodbath/rest.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"junegunn/vader.vim",
	{
		"nvim-orgmode/orgmode",
		opts = {
			org_agenda_files = { "~/org/*" },
			org_default_notes_file = "~/org/refile.org",
		},
		config = function(_, opts)
			require("orgmode").setup(opts)
			require("orgmode").setup_ts_grammar()
		end,
	},
}
