return {
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        event = "VeryLazy",
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
        end,
        keys = {
            "<leader>mtc", -- Default invocation prefix
            {
                "<leader>mtc.",
                "<cmd>TextCaseOpenTelescope<CR>",
                mode = { "n", "v" },
                desc = "Telescope"
            },
        },
    },
    {
        'echasnovski/mini.trailspace',
        version = '*',
        opts = {},
        event = "VeryLazy"
    },
    {
        'echasnovski/mini.pairs',
        version = '*',
        opts = {}
    },
    {
        'echasnovski/mini.align',
        version = '*',
        opts = {},
        event = "VeryLazy"
    },
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        'echasnovski/mini.move',
        version = '*',
        opts = {
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '<M-Left>',
                right = '<M-Right>',
                down = '<M-Down>',
                up = '<M-Up>',

                -- Move current line in Normal mode
                line_left = '<M-Left>',
                line_right = '<M-Right>',
                line_down = '<M-Down>',
                line_up = '<M-Up>',
            },

            options = {
                reindent_linewise = true,
            },
        }
    },
}
