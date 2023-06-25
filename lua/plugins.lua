return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'vimwiki/vimwiki'

    use 'tpope/vim-fugitive'

    use 'rhysd/vim-clang-format'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
      "folke/tokyonight.nvim",
      config = function ()
        require("tokyonight").setup {
            transparent = true,
            styles = {
               sidebars = "transparent",
               floats = "transparent",
            }
        }
      end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {
                'williamboman/mason.nvim',
                run = ':MasonUpdate'
            }, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use 'nvim-lualine/lualine.nvim'

    use {
        'johmsalas/text-case.nvim',
        config = function()
            require('textcase').setup {}
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
            require("which-key").setup {}
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {'nvim-lua/plenary.nvim'}
    }

end)
