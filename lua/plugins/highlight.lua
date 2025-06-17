return {
    -- provide highlighting based on file format
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = ENABLE_TREESITTER,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "bash", "c", "c_sharp", "cpp", "css", "csv", "dockerfile", "elixir", "git_config", "git_rebase",
                    "gitattributes", "gitcommit", "gitignore", "go", "gomod", "gosum", "html", "ini", "javascript",
                    "json", "lua", "markdown", "markdown_inline", "powershell", "python", "query", "regex", "rust",
                    "ssh_config", "toml", "typescript", "vim", "vimdoc", "yaml"
                },
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                }
            })
        end
    },
    -- adds indentation guides to Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        -- enabled = false,
        event = "UIEnter",
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
        keys = {
            {
                "<leader>ti",
                vim.cmd.IBLToggle,
                mode = { "n" },
                desc = "Toggle IBL"
            }
        }
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
