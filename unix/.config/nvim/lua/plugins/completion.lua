return {
	-- snippets
	"L3MON4D3/LuaSnip",

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{
						name = "buffer",
						-- keyword_length = 3,
						-- option = {
						-- 	keyword_pattern = [[\k\+]],
						-- }
					},
					{ name = "orgmode" },
				},

				-- -- Custom entry filtering
				-- formatting = {
				-- 	format = function(entry, vim_item)
				-- 		if vim_item.abbr:match("%s") then
				-- 			vim_item.abbr = ""
				-- 		end
				-- 		return vim_item
				-- 	end,
				-- },

				-- Additional filtering at the source level
				sorting = {
					comparators = {
						function(entry1, entry2)
							local contains_space = function(e)
								return e.completion_item.label:match("%s")
							end
							if contains_space(entry1) then
								return false
							elseif contains_space(entry2) then
								return true
							end
							return nil
						end,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},

				mapping = cmp.mapping.preset.insert({
					-- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
					-- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-g>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),

				-- Add vim-dadbod-completion in sql files
				_ = vim.cmd([[
					augroup DadbodSql
					au!
					autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
					augroup END
					]]),
			}
		end,
	},
}
