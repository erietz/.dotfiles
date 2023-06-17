local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.http = {
    install_info = {
        url = "https://github.com/NTBBloodbath/tree-sitter-http",
        files = { "src/parser.c" },
        branch = "main",
    },
}

-- putting clang before gcc fixes c99 mode on antient centos
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "c_sharp",
        "comment",
        "css",
        "dart",
        "go",
        "html",
        "http",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "org",
        "python",
        "rust",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
        }
    },
}
