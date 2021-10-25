-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
    },
    {
        { name = 'buffer' },
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jedi_language_server.setup{
  capabilities = capabilities
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}

require'lspconfig'.html.setup {
  capabilities = capabilities
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

require'lspconfig'.clangd.setup{
  capabilities = capabilities
}

require'lspconfig'.texlab.setup{
  capabilities = capabilities
}

function install_language_servers()
  local command = {
    'sudo',
    'npm',
    'install',
    '-g',
    -- python
    'pyright',
    -- javascript
    'typescript', 'typescript-language-server',
    -- html
    'vscode-langservers-extracted',
  }
  local command = table.concat(command, " ") .. "\n"
  vim.fn['terminator#open_terminal']()
  vim.fn['terminator#send_to_terminal'](command)
end
