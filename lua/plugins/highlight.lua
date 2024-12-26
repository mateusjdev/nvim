return {
    -- provide highlighting based on file format
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = ENABLE_TREESITTER,
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript",
                "html", "query", "rust", "markdown", "go",
                "dockerfile", "cpp", "bash", "yaml", "regex" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        main = "nvim-treesitter.configs"
    },
    -- adds indentation guides to Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        -- enabled = false,
        -- opts = {},
        -- TODO: test another plugin or make it work with vim.opt.list
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }
            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they
            -- are reset every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup({
                scope = {
                    highlight = highlight,
                    priority = 10000
                },
                indent = {
                    priority = 10000
                }
            })

            hooks.register(hooks.type.SCOPE_HIGHLIGHT,
                hooks.builtin.scope_highlight_from_extmark)
        end,
        event = "UIEnter"
    },
    -- hide your colorcolumn when unneeded.
    {
        "m4xshen/smartcolumn.nvim",
        event = "UIEnter",
        opts = {
            disabled_filetypes = {
                "NvimTree", "lazy", "mason", "help", "checkhealth", "lspinfo",
                "Trouble", "zsh"
            }
        }
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
        keys = {
            {
                "<leader>tco",
                vim.cmd.ColorizerToggle,
                desc = "Toggle colorizer"
            },
        }
    },
}
