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
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x',
        lazy = false,
        dependencies = {
            -- Manage the language servers from neovim
            { "williamboman/mason.nvim", build = ":MasonUpdate" },
            'williamboman/mason-lspconfig.nvim',
            -- LSP Support
            'neovim/nvim-lspconfig',
            -- Autocompletion
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-treesitter/nvim-treesitter-context'
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {}
    },
    {
        "folke/neodev.nvim",
        opts = {},
        enabled = true
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {}
    }
}
