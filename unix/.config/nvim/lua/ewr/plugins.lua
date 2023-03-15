local use = require('packer').use

return require('packer').startup(function()

    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- managing files
    use {
        'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        }
    }
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope-dap.nvim', config = function()
		require('telescope').load_extension('dap')
		end
	}
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function() require("nvim-tree").setup() end
    }

    -- code running
    use 'erietz/vim-terminator'
    use 'erietz/vim-tsl'
    use 'tpope/vim-dispatch'
    use 'vim-test/vim-test'
    use 'tartansandal/vim-compiler-pytest'

    -- language support
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-treesitter/playground',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use 'lervag/vimtex'
    use 'editorconfig/editorconfig-vim'
    use 'neoclide/jsonc.vim'
    use 'erietz/vim-todo'
    use 'erietz/vim-doconce'
    use 'bfrg/vim-jq'
    use "lukas-reineke/indent-blankline.nvim"   -- reading yaml indented 2 spaces...

    -- autocomplete
    use {
        'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',

        'saadparwaiz1/cmp_luasnip',  -- luasnip snippets
        'Decodetalkers/csharpls-extended-lsp.nvim'
    }

    use {
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets'
    }

    -- text editing
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'junegunn/vim-easy-align'

    -- git
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    -- debugging
    use 'mfussenegger/nvim-dap'
    use {'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap'}
    use {'mfussenegger/nvim-dap-python', requires = 'mfussenegger/nvim-dap'}
    use {'leoluz/nvim-dap-go', requires = 'mfussenegger/nvim-dap'}
    use {'mxsdev/nvim-dap-vscode-js', requires = 'mfussenegger/nvim-dap'}

    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npm run compile",
        tag = 'v1.74.1'
    }

    -- colors
    use {
        'norcalli/nvim-colorizer.lua',
        'gruvbox-community/gruvbox',
        'luisiacc/gruvbox-baby',
        'junegunn/seoul256.vim',
        'RRethy/nvim-base16',
        'NLKNguyen/papercolor-theme',
        'lifepillar/vim-solarized8',
        'arzg/vim-colors-xcode',
    }
    use { 'erietz/set3.nvim', requires = 'tjdevries/colorbuddy.nvim' }

    use {
        'nvim-lualine/lualine.nvim',
        disable = false,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end
    }

    -- web dev
    use { "NTBBloodbath/rest.nvim", requires = "nvim-lua/plenary.nvim" }

    -- vimscript dev
    use 'junegunn/vader.vim'

    -- Email
    if vim.fn.executable("himalaya") == 1 then
        use 'https://git.sr.ht/~soywod/himalaya-vim'
    end

    -- the dark side of the force
    use 'nvim-orgmode/orgmode'

end)

