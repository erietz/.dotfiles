--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.pyright.setup{
  capabilities = capabilities
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}

require'lspconfig'.html.setup {
  capabilities = capabilities
}

require'lspconfig'.clangd.setup{
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
