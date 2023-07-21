-- -- Email
-- if vim.fn.executable("himalaya") == 1 then
-- 	'https://git.sr.ht/~soywod/himalaya-vim'
-- end

return {
	-- managing files
	{
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
	},
	{ 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
	{
		'nvim-telescope/telescope-dap.nvim',
		config = function() require('telescope').load_extension('dap') end
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
		config = function() require("nvim-tree").setup() end
	},

	-- code running
	'erietz/vim-terminator',
	'erietz/vim-tsl',
	'tpope/vim-dispatch',
	'vim-test/vim-test',
	'tartansandal/vim-compiler-pytest',

	-- language support
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{
		'nvim-treesitter/playground',
		dependencies = 'nvim-treesitter/nvim-treesitter'
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = 'nvim-treesitter/nvim-treesitter'
	},
	'lervag/vimtex',
	'editorconfig/editorconfig-vim',
	'neoclide/jsonc.vim',
	'erietz/vim-todo',
	'erietz/vim-doconce',
	'bfrg/vim-jq',
	"lukas-reineke/indent-blankline.nvim", -- reading yaml indented 2 spaces...
	{ 'jose-elias-alvarez/null-ls.nvim', dependencies = "nvim-lua/plenary.nvim" },

	'tpope/vim-dotenv',
	'tpope/vim-dadbod',
	'kristijanhusak/vim-dadbod-completion',
	'kristijanhusak/vim-dadbod-ui',

	-- autocomplete
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'saadparwaiz1/cmp_luasnip',
	'Decodetalkers/csharpls-extended-lsp.nvim',

	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',

	-- text editing
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'tpope/vim-repeat',
	'junegunn/vim-easy-align',

	-- git
	'tpope/vim-fugitive',
	{
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns').setup() end
	},

	-- debugging
	'mfussenegger/nvim-dap',
	{ 'rcarriga/nvim-dap-ui', dependencies = 'mfussenegger/nvim-dap' },
	{ 'mfussenegger/nvim-dap-python', dependencies = 'mfussenegger/nvim-dap' },
	{ 'leoluz/nvim-dap-go', dependencies = 'mfussenegger/nvim-dap' },
	{ 'mxsdev/nvim-dap-vscode-js', dependencies = 'mfussenegger/nvim-dap' },

	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
		tag = 'v1.74.1'
	},

	-- colors
	{ 'erietz/set3.nvim', dependencies = 'tjdevries/colorbuddy.nvim' },
	'norcalli/nvim-colorizer.lua',
	'gruvbox-community/gruvbox',
	'junegunn/seoul256.vim',
	"rebelot/kanagawa.nvim",
	"neanias/everforest-nvim",

	{
		'nvim-lualine/lualine.nvim',
		disable = false,
		dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
		config = function() require('lualine').setup {} end
	},

	-- web dev
	{ "NTBBloodbath/rest.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- vimscript dev
	'junegunn/vader.vim',


	'nvim-orgmode/orgmode',
}
