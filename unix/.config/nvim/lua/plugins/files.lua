return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			local keymap = require("ewr.keymap")
			local action_layout = require("telescope.actions.layout")

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<c-k>"] = action_layout.toggle_preview,
						},
						i = {
							["<c-k>"] = action_layout.toggle_preview,
						},
					},
				},
			})
			require("telescope").load_extension("dap")

			keymap.nnoremap("<leader>ff", function()
				require("telescope.builtin").find_files()
			end, { desc = "Telescope: find files" })

			keymap.nnoremap("<leader><Tab>", function()
				require("telescope.builtin").buffers()
			end, { desc = "Telescope: find buffers" })

			keymap.nnoremap("<c-p>", function()
				require("telescope.builtin").git_files()
			end, { desc = "Telescope: find git files" })

			keymap.nnoremap("<leader>fg", function()
				require("telescope.builtin").live_grep()
			end, { desc = "Telescope: Live grep" })

			keymap.nnoremap("<leader>fp", function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end)

			keymap.nnoremap("<leader>fw", function()
				require("telescope.builtin").grep_string()
			end, { desc = "Telescope: Grep string under cursor" })

			keymap.nnoremap("<leader>fh", function()
				require("telescope.builtin").help_tags()
			end, { desc = "Telescope: find help tags" })

			keymap.nnoremap("<leader>fc", function()
				require("telescope.builtin").git_commits()
			end, { desc = "Telescope: find git commits for current repo" })

			keymap.nnoremap("<leader>fb", function()
				require("telescope.builtin").git_bcommits()
			end, { desc = "Telescope: find git commits for current buffer" })

			keymap.nnoremap("<leader>fi", function()
				require("telescope.builtin").builtin()
			end, { desc = "Telescope: search telescope built in functions" })

			keymap.nnoremap("<leader>fk", function()
				require("telescope.builtin").keymaps()
			end, { desc = "Telescope: search normal mode key mappings" })

			keymap.nnoremap("<leader>.", function()
				require("telescope.builtin").find_files({
					find_command = { "fd", "--type", "f" },
					follow = true,
					hidden = true,
					search_dirs = { vim.env.HOME .. "/.dotfiles/" },
				})
			end, { desc = "Telescope: find through my dotfiles" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons", -- optional, for file icons
		config = function()
			local keymap = require("ewr.keymap")

			keymap.nnoremap("<leader>dv", ":NvimTreeToggle<CR>", { desc = "View tree of project" })

			keymap.nnoremap("<leader>fv", ":NvimTreeFindFile<CR>", { desc = "View tree of current file" })
			require("nvim-tree").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local keymap = require("ewr.keymap")

			local line_ending = nil
			if vim.fn.has("win32") == 1 then
				line_ending = "\r\n"
			else
				line_ending = "\n"
			end

			local path = {
				absolute = function()
					return vim.fn.expand("%:p")
				end,
				dirname = function()
					return vim.fn.expand("%:h")
				end,
				basename = function()
					return vim.fn.expand("%:t")
				end,
				root = function()
					return vim.fn.expand("%:r")
				end,
				root_absolute = function()
					return vim.fn.expand("%:p:r")
				end,
			}

			local harpoon_filetype_map = {
				python = function()
					return "python " .. path:absolute()
				end,
				javascript = function()
					return "node " .. path:absolute()
				end,
				typescript = function()
					return "ts-node " .. path:absolute()
				end,
				lua = function()
					return "lua " .. path:absolute()
				end,
				dart = function()
					return "dart " .. path:absolute()
				end,
				c = function()
					return "gcc " .. path:absolute() .. " -o " .. path:root_absolute() .. " && " .. path:root_absolute()
				end,
				rust = function()
					return "cargo run"
				end,
			}

			local function run_harpoon_cmd_and_navigate()
				local filetype = vim.bo.filetype
				local cmd = harpoon_filetype_map[filetype]
				if cmd == nil then
					print("no command for this filetype")
					return
				end
				require("harpoon.term").sendCommand(1, cmd() .. line_ending)
				require("harpoon.term").gotoTerminal(1)
			end

			keymap.nnoremap("<leader>a", function()
				require("harpoon.mark").add_file()
				print("Harpoon mark added", path:absolute())
			end, { desc = "Harpoon: Adds mark for the current file" })

			keymap.nnoremap("<leader>h", function()
				require("harpoon.ui").toggle_quick_menu()
			end, { silent = true, desc = "Harpoon: Toggle quick menu" })

			keymap.nnoremap("<leader>1", function()
				require("harpoon.ui").nav_file(1)
			end, { silent = true, desc = "Harpoon: navigate to file 1" })

			keymap.nnoremap("<leader>2", function()
				require("harpoon.ui").nav_file(2)
			end, { silent = true, desc = "Harpoon: navigate to file 2" })

			keymap.nnoremap("<leader>3", function()
				require("harpoon.ui").nav_file(3)
			end, { silent = true, desc = "Harpoon: navigate to file 3" })

			keymap.nnoremap("<leader>4", function()
				require("harpoon.ui").nav_file(4)
			end, { silent = true, desc = "Harpoon: navigate to file 4" })

			keymap.nnoremap("<leader>5", function()
				require("harpoon.ui").nav_file(5)
			end, { silent = true, desc = "Harpoon: navigate to file 5" })

			keymap.nnoremap("<localleader>1", function()
				require("harpoon.term").gotoTerminal(1)
			end, { silent = true, desc = "Harpoon: navigate to terminal 1" })

			keymap.nnoremap("<localleader>2", function()
				require("harpoon.term").gotoTerminal(2)
			end, { silent = true, desc = "Harpoon: navigate to terminal 2" })

			keymap.nnoremap("<localleader>r", function()
				run_harpoon_cmd_and_navigate()
			end, { desc = "Harpoon: Run the current file in the first harpoon terminal" })
		end,
	},
}
