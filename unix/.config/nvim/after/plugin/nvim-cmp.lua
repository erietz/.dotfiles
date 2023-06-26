local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{
			name = "buffer",
			option = {
				keyword_pattern = [[\k\+]],
			}
		},
		{ name = "path" },
		{ name = 'nvim_lua' },
		{ name = 'orgmode' },
		{ name = 'nvim_lsp_signature_help' },
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
})
