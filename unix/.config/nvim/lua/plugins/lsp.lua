return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig").util
			local keymap = require("ewr.keymap")

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local on_attach = function(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { silent = true, buffer = bufnr }
				keymap.nnoremap("gd", vim.lsp.buf.definition, bufopts)
				keymap.nnoremap("gD", vim.lsp.buf.declaration, bufopts)
				keymap.nnoremap("gr", vim.lsp.buf.references, bufopts)
				keymap.nnoremap("gi", vim.lsp.buf.implementation, bufopts)
				keymap.nnoremap("<leader>ls", vim.lsp.buf.signature_help, bufopts)
				keymap.inoremap("<C-s>", vim.lsp.buf.signature_help, bufopts)
				keymap.nnoremap("<leader>lh", vim.lsp.buf.hover, bufopts)
				keymap.nnoremap("<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				keymap.nnoremap("<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				keymap.nnoremap("<leader>ws", vim.lsp.buf.workspace_symbol, bufopts)
				keymap.nnoremap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				keymap.nnoremap("<leader>lt", vim.lsp.buf.type_definition, bufopts)
				keymap.nnoremap("<leader>lr", vim.lsp.buf.rename, bufopts)
				keymap.nnoremap("<leader>la", vim.lsp.buf.code_action, bufopts)
				keymap.nnoremap("<leader>lf", vim.lsp.buf.format, bufopts)

				keymap.nnoremap("<leader>ld", function()
					vim.diagnostic.setqflist(vim.lsp.diagnostic.get_line_diagnostics())
				end, { silent = true })
				-- keymap.nnoremap('<leader>ld', function() vim.diagnostic.setqflist(vim.lsp.diagnostic.get_line_diagnostics()) end, { silent = true })
				keymap.nnoremap("[d", vim.diagnostic.goto_prev, { silent = true })
				keymap.nnoremap("]d", vim.diagnostic.goto_next, { silent = true })
				keymap.nnoremap("<leader>ll", vim.diagnostic.setloclist, { silent = true })

				-- keymap.nnoremap('<leader>le', vim.lsp.diagnostic.setloclist, bufopts)
				-- keymap.nnoremap(']e', vim.lsp.diagnostic.goto_next, bufopts)
				-- keymap.nnoremap('[e', vim.lsp.diagnostic.goto_prev, bufopts)
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp_defaults = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lsp_defaults, {
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			}))
			lspconfig.pylsp.setup(vim.tbl_deep_extend("force", lsp_defaults, {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								maxLineLength = 100,
							},
						},
					},
				},
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					keymap.nnoremap("<leader>dc", function()
						require("dap-python").test_class()
					end, { silent = true, desc = "Debugger: debug python test class" })

					keymap.nnoremap("<leader>dm", function()
						require("dap-python").test_method()
					end, { silent = true, desc = "Debugger: debug python test method" })

					keymap.vnoremap("<leader>ds", function()
						require("dap-python").debug_selection({})
					end, { silent = true, desc = "Debugger: debug python selection" })
				end,
			}))
			lspconfig.bashls.setup(lsp_defaults)
			lspconfig.clangd.setup(lsp_defaults)
			lspconfig.html.setup(lsp_defaults)
			lspconfig.cssls.setup(lsp_defaults)
			lspconfig.vuels.setup(lsp_defaults)
			lspconfig.ts_ls.setup(lsp_defaults)
			lspconfig.dartls.setup(lsp_defaults)
			lspconfig.sqlls.setup(vim.tbl_deep_extend("force", lsp_defaults, {
				root_dir = function()
					return vim.loop.cwd()
				end,
			}))
			lspconfig.gopls.setup(vim.tbl_deep_extend("force", lsp_defaults, {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					keymap.nnoremap("<leader>dn", function()
						require("dap-go").debug_test()
					end, { desc = "Debugger: debug nearest test" })

					keymap.nnoremap("<leader>dl", function()
						require("dap-go").debug_last_test()
					end, { desc = "Debugger: debug last test" })
				end,
			}))
			lspconfig.csharp_ls.setup(vim.tbl_deep_extend("force", lsp_defaults, {
				filetypes = { "cs" },
				root_dir = util.root_pattern("*.sln", "*.csproj"),
				handlers = {
					["textDocument/definition"] = require("csharpls_extended").handler,
				},
			}))
			lspconfig.texlab.setup(lsp_defaults)

			-- local rt = require("rust-tools")

			-- rt.setup({
			--   server = {
			--     on_attach = function(_, bufnr)
			--       -- Hover actions
			--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			--       -- Code action groups
			--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			--     end,
			--   },
			-- })

			lspconfig.rust_analyzer.setup(lsp_defaults)
		end,
	},
	"Decodetalkers/csharpls-extended-lsp.nvim",
	"simrat39/rust-tools.nvim",
}
