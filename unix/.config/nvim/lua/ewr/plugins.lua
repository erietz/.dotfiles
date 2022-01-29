return require('packer').startup(function()

    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- managing files
    use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use 'junegunn/fzf.vim'

    use { 'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    use { 'preservim/nerdtree' }

    -- code running
    use 'erietz/vim-terminator'
    use 'tpope/vim-dispatch'
    use 'vim-test/vim-test'
    use 'tartansandal/vim-compiler-pytest'

    -- language support
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',
        requires = {'nvim-treesitter/nvim-treesitter'}
    }
    use 'neovim/nvim-lspconfig'
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup()
        end
    }
    -- use {'sheerun/vim-polyglot'}
    use 'lervag/vimtex'
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'

    -- autocomplete
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    -- use 'hrsh7th/nvim-cmp'
    -- use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
    -- use { 'hrsh7th/cmp-buffer', requires = 'hrsh7th/nvim-cmp' }
    -- use { 'hrsh7th/cmp-path', requires = 'hrsh7th/nvim-cmp' }
    -- use { 'hrsh7th/cmp-nvim-lua', requires = 'hrsh7th/nvim-cmp' }
    -- use { 'quangnguyen30192/cmp-nvim-ultisnips',
    --     requires = { 'hrsh7th/nvim-cmp', 'SirVer/ultisnips' }
    -- }
    -- use "folke/lua-dev.nvim"

    -- text editing
    use 'SirVer/ultisnips'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'junegunn/vim-easy-align'

    -- git
    use 'tpope/vim-fugitive'
    use { 'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require('gitsigns').setup() end
    }

    -- debugging
    use 'mfussenegger/nvim-dap'
    use { 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }
    use { 'mfussenegger/nvim-dap-python', requires = 'mfussenegger/nvim-dap' }

    -- colors
    use
    {
        'norcalli/nvim-colorizer.lua',
        'gruvbox-community/gruvbox',
        'junegunn/seoul256.vim',
        'junegunn/rainbow_parentheses.vim',
        'chriskempson/base16-vim',
    }
    use { 'erietz/vim-voodoo', requires = 'tjdevries/colorbuddy.nvim' }
    use { 'tjdevries/gruvbuddy.nvim', requires = 'tjdevries/colorbuddy.nvim' }

    -- web dev
    use { "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rest-nvim").setup({
                result_split_horizontal = false,
                skip_ssl_verification = false,
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                jump_to_request = false,
            })
        end
    }

    -- vimscript dev
    use 'junegunn/vader.vim'

end)

