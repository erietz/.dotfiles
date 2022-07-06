local lspconfig = require("lspconfig")
local keymap = require("ewr.keymap")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent=true, buffer=bufnr }
  keymap.nnoremap('gD', vim.lsp.buf.declaration, bufopts)
  keymap.nnoremap('gd', vim.lsp.buf.definition, bufopts)
  keymap.nnoremap('K', vim.lsp.buf.hover, bufopts)
  keymap.nnoremap('gi', vim.lsp.buf.implementation, bufopts)
  keymap.nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap.nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap.nnoremap('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap.nnoremap('<space>rn', vim.lsp.buf.rename, bufopts)
  keymap.nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap.nnoremap('gr', vim.lsp.buf.references, bufopts)
  keymap.nnoremap('<space>f', vim.lsp.buf.formatting, bufopts)
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

lspconfig['sumneko_lua'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['tsserver'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
