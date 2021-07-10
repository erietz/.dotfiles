return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}
    use {'gruvbox-community/gruvbox'}
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }
    use {'erietz/vim-terminator'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'SirVer/ultisnips'}
    -- Post-install/update hook with neovim command
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-dispatch'}
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
    use {'sheerun/vim-polyglot'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'vim-test/vim-test'}
    use {'tartansandal/vim-compiler-pytest'}
    use {'puremourning/vimspector'}
    use {'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
end
)
