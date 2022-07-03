local keymap = require("ewr.keymap")

vim.g.coc_global_extensions = {
    -- language servers
    'coc-clangd',       -- c, c++, objective c
    'coc-css',          -- css, scss, less
    'coc-html',         -- html, handlebars, razor
    'coc-pyright',      -- python
    'coc-omnisharp',    -- csharp and visual basic
    'coc-java',         -- java
    'coc-rls',          -- rust
    'coc-sh',           -- bash
    'coc-sql',          -- sql
    'coc-sumneko-lua',  -- lua
    'coc-texlab',       -- latex
    'coc-tsserver',     -- javascript and typescript
    'coc-vimlsp',       -- viml
    'coc-flutter',      -- flutter
    -- extras
    'coc-git',
    'coc-snippets',
    'coc-diagnostic',
    'coc-json',
    'coc-xml',
    'coc-yaml',
    'coc-toml',
}

keymap.nnoremap(']g', [[<Plug>(coc-diagnostics-next)]])
keymap.nnoremap('[g', [[<Plug>(coc-diagnostics-prev)]])
keymap.nnoremap(']r', [[:CocNext<CR>]])
keymap.nnoremap('[r', [[:CocPrev<CR>]])
keymap.nnoremap('gd', [[<Plug>(coc-definition)]])
keymap.nnoremap('gy', [[<Plug>(coc-type-definition)]])
keymap.nnoremap('gi', [[<Plug>(coc-implementation)]])
keymap.nnoremap('gr', [[<Plug>(coc-references)]])
keymap.nnoremap('<leader>rn', [[<Plug>(coc-rename)]])
keymap.nnoremap('<leader>e', ':CocDiagnostics<CR>', { silent = true })
keymap.inoremap('<cr>', function()
    if (vim.fn.pumvisible() ~= 0) then
        return vim.fn['coc#_select_confirm']()
    else
        vim.fn['coc#on_enter']()
        return [[<C-g>u<CR>]]
    end
    end,
    {
        silent = true,
        expr = true,
        desc = "Confirm coc selection or insert a new line if pum not visible"
    }
)

