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

local sumneko_root_path = "/bin"
local sumneko_binary = "lua-language-server"
if vim.fn.has("win32") == 1 then
    sumneko_root_path = [[C:\Users\erietz\Documents\lua-language-server-3.4.2-win32-x64\]]
    sumneko_binary = sumneko_root_path .. [[bin\lua-language-server]]
end

lspconfig['sumneko_lua'].setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        }
    }
})

lspconfig['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['tsserver'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['clangd'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
-- local pid = vim.fn.getpid()
-- local omnisharp_bin = "/Users/erietz/Documents/omnisharp-win-x86/OmniSharp.exe"
-- lspconfig['omnisharp'].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
-- })


lspconfig['csharp_ls'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "cs", "solution" },
    handlers = {
        ["textDocument/definition"] = require("csharpls_extended").handler,
    },
})

lspconfig['html'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['cssls'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig['dartls'].setup({
    -- cmd = { "cmd.exe", "/C", "dart", "language-server", "--lsp" },
    -- root_dir = function() return "/Users/erietz/git/osu-cs492-project3/call_me_maybe" end,
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
