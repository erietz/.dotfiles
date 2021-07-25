return require('packer').startup(function()
    -- packer can manage itself
    use {'wbthomason/packer.nvim'}
    -- managing files
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }
    use {'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    -- code running
    use {'erietz/vim-terminator'}
    -- language support
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/playground',
      requires = {'nvim-treesitter/nvim-treesitter'}
    }
    use {'neovim/nvim-lspconfig'}
    --use {'sheerun/vim-polyglot'}
    use {'lervag/vimtex'}
    -- autocomplete
    use {'hrsh7th/nvim-compe'}
    use {'SirVer/ultisnips'}
    -- text editing
    use {'tpope/vim-commentary'}
    use {'tpope/vim-surround'}
    use {'junegunn/vim-easy-align'}
    -- git
    use {'tpope/vim-fugitive'}
    use {
      'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function()
        require('gitsigns').setup()
      end
    }
    -- unit testing
    use {'tpope/vim-dispatch'}
    use {'vim-test/vim-test'}
    use {'tartansandal/vim-compiler-pytest'}
    -- debugging
    use {
      'mfussenegger/nvim-dap',
      requires = {
        {'rcarriga/nvim-dap-ui'},
        {'mfussenegger/nvim-dap-python'},
      }
    }
    -- colors
    use {'norcalli/nvim-colorizer.lua'}
    use {'gruvbox-community/gruvbox'}
    use {'sainnhe/sonokai'}
    use {'sainnhe/gruvbox-material'}
    use {'sainnhe/everforest'}
    use {'sainnhe/edge'}
    use {
      '~/git/vim-voodoo',
      requires = 'tjdevries/colorbuddy.nvim'
    }
    use {
      'tjdevries/gruvbuddy.nvim',
      requires = 'tjdevries/colorbuddy.nvim'
    }
end
)
