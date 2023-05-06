return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vimwiki/vimwiki'

  use { 'johmsalas/text-case.nvim',
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
