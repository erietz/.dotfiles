local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{
			name = "buffer",
			keyword_length = 5,
			option = {
				keyword_pattern = [[\k\+]],
			}
		},
		{ name = 'orgmode' },
	}),

	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
		['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-g>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
	}),

	-- Add vim-dadbod-completion in sql files
	_ = vim.cmd [[
	  augroup DadbodSql
		au!
		autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
	  augroup END
	]]

})
