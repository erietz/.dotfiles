local keymap = require("ewr.keymap")

vim.g.coc_global_extensions = {
    -- language servers
    'coc-clangd',       -- c, c++, objective c
    'coc-css',          -- css, scss, less
    'coc-html',         -- html, handlebars, razor
    'coc-pyright',      -- python
    'coc-omnisharp',    -- csharp and visual basic
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

keymap.nnoremap(']g', [[<Plug>(coc-diagnostics-next)]], {})
keymap.nnoremap('[g', [[<Plug>(coc-diagnostics-prev)]], {})
keymap.nnoremap(']r', [[:CocNext<CR>]], {})
keymap.nnoremap('[r', [[:CocPrev<CR>]], {})
keymap.nnoremap('gd', [[<Plug>(coc-definition)]], {})
keymap.nnoremap('gy', [[<Plug>(coc-type-definition)]], {})
keymap.nnoremap('gi', [[<Plug>(coc-implementation)]], {})
keymap.nnoremap('gr', [[<Plug>(coc-references)]], {})
keymap.nnoremap('<leader>rn', [[<Plug>(coc-rename)]], {})

--function Coc_selection_confirm()
--    if (vim.fn.pumvisible() ~= 0) then
--        vim.cmd([[normal o]])
--        -- vim.fn['coc#on_enter']()
--        --
--    else
--        vim.fn['coc#_select_confirm']()
--    end
--end
--inoremap('<cr>', '<c-o>:lua Coc_selection_confirm()<CR>', {})

keymap.inoremap(
    '<cr>',                                 -- TODO: what the hell does this do?
    [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    { expr = true, silent = true }
)

-- fix lsp diagnostics
keymap.nnoremap('<leader>e', ':CocDiagnostics<CR>', { silent = true })

