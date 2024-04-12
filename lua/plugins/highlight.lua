return {
    -- provide highlighting based on file format
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = ENABLE_TREESITTER,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript",
                    "html", "query", "rust", "markdown", "go",
                    "dockerfile", "cpp", "bash", "yaml", "regex" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    -- adds indentation guides to Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        event = "VeryLazy"
    },
    -- hide your colorcolumn when unneeded.
    {
        "m4xshen/smartcolumn.nvim",
        opts = {},
        event = "VeryLazy"
    },
    -- highlight and search for todo comments like TODO, HACK, BUG in your code
    -- base.
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        event = "VeryLazy"
    },
    -- a color highlighter
    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
        event = "VeryLazy"
    },
}
