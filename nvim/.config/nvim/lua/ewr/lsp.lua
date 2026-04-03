vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace", -- or "Both"
			},
			hint = {
				enable = true, -- inline hints (nice bonus)
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
})
vim.lsp.enable("lua_ls")


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

	if client == nil then
		return
	end

    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
    })

	vim.keymap.set("i", "<C-k>", vim.lsp.buf.hover)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover)


	local bufopts = { silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, bufopts)

	vim.keymap.set("n", "<leader>ld", function()
		vim.diagnostic.setqflist(vim.lsp.diagnostic.get_line_diagnostics())
	end, { silent = true })
	-- vim.keymap.set("n", '<leader>ld', function() vim.lsp.diagnostic.setqflist(vim.lsp.diagnostic.get_line_diagnostics()) end, { silent = true })
	-- vim.keymap.set("n", "[d", vim.lsp.diagnostic.goto_prev, { silent = true })
	-- vim.keymap.set("n", "]d", vim.lsp.diagnostic.goto_next, { silent = true })
	vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { silent = true })
  end,
})
