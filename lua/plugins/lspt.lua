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
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
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
