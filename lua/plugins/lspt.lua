-- lsp tools: plugins that that improve coding experience but are not needed for LSP config
return {
    {
        'nvim-telescope/telescope-project.nvim',
        enabled = false
    },
    {
        'natecraddock/workspaces.nvim',
        enabled = false
    },
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        enabled = false,
        opts = {}
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        enable = ENABLE_TREESITTER
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {}
    },
    -- TODO: check need to move to plugins/ui|extra
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            direction = 'float'
        }
    }
}
