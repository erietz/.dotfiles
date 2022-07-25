-- if vim.fn.has("win32") or vim.fn.has("win64") then
--     return
-- end

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
    "c_sharp",
    "comment",     --  ‘for’ loop initial declarations are only allowed in C99 mode
    "css",
    "dart",
    "go",
    "html",
    "http",
    "javascript",  -- ‘for’ loop initial declarations are only allowed in C99 mode
    "json",
    "latex",
    "lua",
    "make",
    "python",
    "rust",
    "scss",
    "toml",
    "tsx",     -- ‘for’ loop initial declarations are only allowed in C99 mode
    "typescript", -- ‘for’ loop initial declarations are only allowed in C99 mode
    "vim",     -- ‘for’ loop initial declarations are only allowed in C99 mode
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  -- rainbow option requires https://github.com/p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
