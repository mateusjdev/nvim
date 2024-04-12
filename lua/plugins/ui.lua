return {
    -- configure statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
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
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { { 'filename', path = 0 } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location', 'hostname' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
        opts = {},
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        version = '^1.0.0',
        opts = {
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = nil}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                undotree = { text = 'undotree' },
                -- Or, specify the event which the sidebar executes when leaving:
                ['neo-tree'] = { event = 'BufWipeout' },
                -- Or, specify both
                Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
            },
        }
    },
    {
        "j-hui/fidget.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("fidget").setup({
                progress = {
                    display = {
                        done_ttl = 5
                    },
                },
                notification = {
                    override_vim_notify = true,
                    configs = {
                        default = vim.tbl_extend(
                            "force",
                            require("fidget.notification").default_config,
                            { ttl = 5 }
                        ),
                    },
                },
                integration = {
                    ["nvim-tree"] = {
                        enable = true,
                    },
                },
            })
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                hijack_netrw_behavior = "open_default",
            }
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Better vim.ui
    -- cmdlines is handled by noice.mini
    -- everything else is handled by fidget.nvim
    {
        -- mateusjdev/noice.nvim is a custom branch of folke/noice.nvim which
        -- uses j-hui/fidget.nvim instead of nvim-notify
        "mateusjdev/noice.nvim",
        branch = "use-fidget",
        priority = 1000,
        lazy = false,
        opts = {
            notify = {
                enabled = false, -- fallback to fidget
            },
            messages = {
                -- ↓ if messages is disabled, cmdline will appear
                enabled = true,              -- enables the Noice messages UI
                view = "notify",             -- default view for messages
                view_error = "notify",       -- view for errors
                view_warn = "notify",        -- view for warnings
                view_history = "messages",   -- view for :messages
                view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
            },
            views = {
                mini = {
                    timeout = 5000,
                    align = "right",
                    position = {
                        row = 1
                    }
                }
            },
            lsp = {
                progress = {
                    enabled = false, -- fallback to fidget
                },
                message = {
                    enabled = false, -- fallback to fidget
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                -- TODO: add option to lsp.lua
                --
                -- override = {
                --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                --     ["vim.lsp.util.stylize_markdown"] = true,
                --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                -- },
            },
            routes = {
                {
                    filter = {
                        event = 'msg_show',
                        any = {
                            -- { find = '%d+L, %d+B' },
                            { find = '; after #%d+' },
                            { find = '; before #%d+' },
                            { find = '%d fewer lines' },
                            { find = '%d more lines' },
                        },
                    },
                    opts = { skip = true },
                }
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim"
        }
    }
}
