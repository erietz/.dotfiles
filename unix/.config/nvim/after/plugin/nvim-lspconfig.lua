local lspconfig = require("lspconfig")
local util = require("lspconfig").util
local keymap = require("ewr.keymap")
local spread = require("ewr.spread").spread

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { silent = true, buffer = bufnr }
    keymap.nnoremap('gd', vim.lsp.buf.definition, bufopts)
    keymap.nnoremap('gD', vim.lsp.buf.declaration, bufopts)
    keymap.nnoremap('gr', vim.lsp.buf.references, bufopts)
    keymap.nnoremap('gi', vim.lsp.buf.implementation, bufopts)
    keymap.nnoremap('<leader>ls', vim.lsp.buf.signature_help, bufopts)
    keymap.nnoremap('<leader>lh', vim.lsp.buf.hover, bufopts)
    keymap.nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap.nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap.nnoremap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap.nnoremap('<leader>lt', vim.lsp.buf.type_definition, bufopts)
    keymap.nnoremap('<leader>lr', vim.lsp.buf.rename, bufopts)
    keymap.nnoremap('<leader>la', vim.lsp.buf.code_action, bufopts)
    keymap.nnoremap('<leader>lf', vim.lsp.buf.format, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local lsp_defaults = spread{
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.sumneko_lua.setup(lsp_defaults{
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
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        }
    }
})
lspconfig.pylsp.setup(lsp_defaults{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 100
                }
            }
        }
    }
})
lspconfig.rust_analyzer.setup(lsp_defaults{})
lspconfig.clangd.setup(lsp_defaults{})
lspconfig.html.setup(lsp_defaults{})
lspconfig.cssls.setup(lsp_defaults{})
lspconfig.tsserver.setup(lsp_defaults{})
lspconfig.dartls.setup(lsp_defaults{})
lspconfig.gopls.setup(lsp_defaults{})
lspconfig.csharp_ls.setup(lsp_defaults{
    filetypes = { "cs" },
    root_dir = util.root_pattern("*.sln") or util.root_pattern("*.csproj"),
    handlers = {
        ["textDocument/definition"] = require("csharpls_extended").handler,
    },
})
