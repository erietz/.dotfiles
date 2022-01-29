-- -- Setup nvim-cmp.
-- local cmp = require'cmp'

-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--         end,
--     },
--     mapping = {
--         ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-g>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.close(),
--         ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
--         ['<CR>'] = cmp.mapping.confirm({ select = false }),
--     },
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'path' },
--         { name = 'ultisnips' }, -- For ultisnips users.
--         { name = 'nvim_lua' }, -- this does nothing
--     },
--     {
--         { name = 'buffer' },
--     })
-- })

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(
--     vim.lsp.protocol.make_client_capabilities()
-- )

-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local missing_language_servers = {}
-- local function setup_lsp_if_server_installed(language_server, func)
--     if vim.fn.executable(language_server) == 1 then
--         func()
--     else
--         table.insert(missing_language_servers, language_server)
--     end
-- end

-- function print_missing_language_servers()
--     print(vim.inspect(missing_language_servers))
-- end

-- setup_lsp_if_server_installed("jedi-language-server", function()
--     require'lspconfig'.jedi_language_server.setup{
--         capabilities = capabilities
--     }
-- end)

-- setup_lsp_if_server_installed("tsserver", function()
--     require'lspconfig'.tsserver.setup{
--         capabilities = capabilities
--     }
-- end)

-- setup_lsp_if_server_installed("vscode-langservers-extracted", function()
--     require'lspconfig'.html.setup {
--         capabilities = capabilities
--     }
-- end)

-- setup_lsp_if_server_installed("vscode-langservers-extracted", function()
--     require'lspconfig'.cssls.setup {
--         capabilities = capabilities,
--     }
-- end)

-- setup_lsp_if_server_installed("jsonls", function()
--     require'lspconfig'.jsonls.setup {
--         capabilities = capabilities,
--     }
-- end)

-- setup_lsp_if_server_installed("clangd", function()
--     require'lspconfig'.clangd.setup{
--         capabilities = capabilities
--     }
-- end)

-- setup_lsp_if_server_installed("texlab", function()
--     require'lspconfig'.texlab.setup{
--         capabilities = capabilities
--     }
-- end)

-- setup_lsp_if_server_installed("omnisharp", function()
--     require'lspconfig'.omnisharp.setup{
--         cmd = {
--             "/bin/omnisharp",
--             "--languageserver",
--             "--hostPID",
--             tostring(vim.fn.getpid())
--         },
--         capabilities = capabilities,
--     }
-- end)

-- setup_lsp_if_server_installed("lua-language-server", function()
--     local luadev = require("lua-dev").setup({
--       lspconfig = {
--         cmd = {"lua-language-server"}
--       },
--     })
--     require('lspconfig').sumneko_lua.setup(luadev)
-- end)


-- function install_language_servers()
--     local command = {
--         'sudo',
--         'npm',
--         'install',
--         '-g',
--         -- python
--         'jedi-language-server',
--         -- javascript
--         'typescript', 'typescript-language-server',
--         -- html
--         'vscode-langservers-extracted',
--     }
--     local command = table.concat(command, " ") .. "\n"
--     vim.fn['terminator#open_terminal']()
--     vim.fn['terminator#send_to_terminal'](command)
-- end
