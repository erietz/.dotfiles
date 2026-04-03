local github = 'https://github.com/'

vim.pack.add({
	{ src = github.."tpope/vim-fugitive" },
	{ src = github.."lewis6991/gitsigns.nvim"},
})

vim.pack.add({ github.."erietz/isocon.nvim" })
local background = vim.env.BACKGROUND or vim.g.background
if background == "light" then
	require("isocon").setup({
		background = "#fdf6e3",
		contrast = 3.0,
		bright_boost = 1.2,
		hues = {
			green = 150,
			magenta = 305,
		},
	})
	vim.cmd("colorscheme isocon")
else
	require("isocon").setup({
		background = "#282c34",
		contrast = 5.0,
		bright_boost = 1.3,
		hues = {
			green = 150,
			magenta = 305,
		},
	})
	vim.cmd("colorscheme isocon")
end

vim.pack.add({
	{ src = github.."nvim-lualine/lualine.nvim"},
	{ src = github.."nvim-tree/nvim-web-devicons"}
})
require("lualine").setup()

vim.pack.add({ github.."ibhagwan/fzf-lua"})
local fzf = require("fzf-lua")
vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader><Tab>', fzf.buffers)
vim.keymap.set('n', '<c-p>', fzf.git_files)
vim.keymap.set('n', '<leader>fg', fzf.live_grep)
vim.keymap.set('n', '<leader>fi', fzf.builtin)
vim.keymap.set('n', '<leader>.', function() fzf.files({ cwd = vim.env.HOME .. "/.dotfiles/" }) end)

vim.pack.add({ github.."nvim-treesitter/nvim-treesitter" })

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

local ts_languages = {
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
	"jsdoc",
	"json",
	-- "latex",
	"lua",
	"make",
	"python",
	"rust",
	"scss",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vue",
	"yaml",
}

require("nvim-treesitter").install(ts_languages)
vim.api.nvim_create_autocmd('FileType', {
	pattern = ts_languages,
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
	end,
})



vim.pack.add({ github.."neovim/nvim-lspconfig" })
vim.pack.add({ github.."github/copilot.vim" })
