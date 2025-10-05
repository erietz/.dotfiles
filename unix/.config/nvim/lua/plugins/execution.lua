return {
	{
		"erietz/vim-terminator",
		config = function()
			local keymap = require("ewr.keymap")

			vim.g.terminator_auto_shrink_output = 1
			vim.g.terminator_repl_delimiter_regex = "--"

			vim.g.terminator_runfile_map = {
				sh = "bash",
				scheme = "racket",
				cs = "dotnet run",
				python = "python3 -u",
				typescript = "npx ts-node",
			}

			vim.g.terminator_repl_command = {
				sql = "mysql -u ethan -p",
				typescript = "npx ts-node",
			}

			keymap.nnoremap("<leader>ra", ":TerminatorRunAltCmd ")
			keymap.nnoremap("<leader>oo", ":TerminatorOutputBufferToggle<CR>")
		end,
	},
	"erietz/vim-tsl",
	{
		"tpope/vim-dispatch",
		config = function()
			local keymap = require("ewr.keymap")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.b.dispatch = "pandoc % -o %:r" .. ".pdf"
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "cs",
				callback = function()
					vim.b.dispatch = "dotnet test"
				end,
			})

			-- Dispatch
			keymap.nnoremap("<leader>mr", ":Make run<CR>", { silent = true })
			keymap.nnoremap("<leader>mb", ":Make build<CR>", { silent = true })
			keymap.nnoremap("<leader>mt", ":Make test<CR>", { silent = true })
			keymap.nnoremap("<leader>mc", ":Make clean<CR>", { silent = true })
		end,
	},
	{
		"vim-test/vim-test",
		config = function()
			local keymap = require("ewr.keymap")

			vim.g["test#strategy"] = "dispatch"
			vim.cmd([[let test#python#pytest#options = '-rA -v']])

			-- vim.g['dispatch_compilers'] = {
			--     ["python"] = "",
			--     ["pytest"] = "pytest"
			-- }

			keymap.nnoremap("<leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })

			keymap.nnoremap("<leader>ts", ":TestSuite<CR>", { desc = "Test suite" })

			keymap.nnoremap("<leader>tf", ":TestFile<CR>", { desc = "Test current file" })

			keymap.nnoremap("<leader>tl", ":TestLast<CR>", { desc = "Test last" })

			keymap.nnoremap("<leader>tv", ":TestVisit<CR>", { desc = "Test visit" })

			keymap.nnoremap(
				"<leader>tt",
				":TestNearest -strategy=neovim<CR>",
				{ desc = "Test nearest using neovim terminal" }
			)
		end,
	},
	"tartansandal/vim-compiler-pytest",
}
