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
        -- enabled = ENABLE_TREESITTER
        enabled = false -- disabled for now (testing nvim-navic)
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        keys = {
            {
                "<leader>tr",
                vim.cmd.Git,
                desc = "Open Git"
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost", -- starting to edit an existing file
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
        },
        keys = {
            {
                "<leader>tt",
                vim.cmd.ToggleTerm,
                desc = "Toggle terminal"
            },
        }

    },
    {
        "tpope/vim-sleuth",
        event = "BufReadPre"
    }
}
