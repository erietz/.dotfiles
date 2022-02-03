if vim.fn.has("win32") or vim.fn.has("win64") then
    return
end

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
      "go",
      "html",
      "http",
      "javascript",  -- ‘for’ loop initial declarations are only allowed in C99 mode
      "json",
      "latex",
      -- "lua",
      "make",
      "python",
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
  }
}
