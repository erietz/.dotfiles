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
    use 'preservim/nerdtree'
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
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
    use 'lervag/vimtex'
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use 'editorconfig/editorconfig-vim'
    use 'neoclide/jsonc.vim'
    use 'tmadsen/vim-compiler-plugin-for-dotnet'
    use 'erietz/vim-todo'
    use 'erietz/vim-doconce'

    -- autocomplete
    use {
        'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip'  -- luasnip snippets
    }

    use 'L3MON4D3/LuaSnip'

    -- text editing
    use 'SirVer/ultisnips'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'junegunn/vim-easy-align'

    -- git
    use 'tpope/vim-fugitive'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use { 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }
    use { 'mfussenegger/nvim-dap-python', requires = 'mfussenegger/nvim-dap' }

    -- colors
    use {
        'norcalli/nvim-colorizer.lua',
        'gruvbox-community/gruvbox',
        'junegunn/seoul256.vim',
        'junegunn/rainbow_parentheses.vim',
        'chriskempson/base16-vim',
        'NLKNguyen/papercolor-theme'
    }
    use { 'erietz/vim-voodoo', requires = 'tjdevries/colorbuddy.nvim' }
    use { 'tjdevries/gruvbuddy.nvim', requires = 'tjdevries/colorbuddy.nvim' }

    use {
      'nvim-lualine/lualine.nvim',
      disable = false,
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
          require('lualine').setup()
      end
    }

    -- web dev
    use { "NTBBloodbath/rest.nvim", requires = "nvim-lua/plenary.nvim" }

    -- vimscript dev
    use 'junegunn/vader.vim'


end)

