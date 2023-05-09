return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vimwiki/vimwiki'

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      config = function()
          require('lualine').setup {
              options = {
                  icons_enabled = true,
                  theme = 'nord',
                  component_separators = { left = '', right = ''},
                  section_separators = { left = '', right = ''},
                  disabled_filetypes = {
                      statusline = {},
                      winbar = {},
                  },
                  ignore_focus = {},
                  always_divide_middle = true,
                  globalstatus = false,
                  refresh = {
                      statusline = 1000,
                      tabline = 1000,
                      winbar = 1000,
                  }
              },
              sections = {
                  lualine_a = {'mode'},
                  lualine_b = {'branch', 'diff', 'diagnostics'},
                  lualine_c = {'filename'},
                  lualine_x = {'encoding', 'fileformat', 'filetype'},
                  lualine_y = {'progress'},
                  lualine_z = {'location'}
              },
              inactive_sections = {
                  lualine_a = {},
                  lualine_b = {},
                  lualine_c = {'filename'},
                  lualine_x = {'location'},
                  lualine_y = {},
                  lualine_z = {}
              },
              tabline = {},
              winbar = {},
              inactive_winbar = {},
              extensions = {}
          }
      end
  }

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
      requires = { {'nvim-lua/plenary.nvim'} }
  }

end)
