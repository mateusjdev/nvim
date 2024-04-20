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
                    configs = {
                        default = vim.tbl_extend(
                            "force",
                            require("fidget.notification").default_config,
                            { ttl = 5 }
                        ),
                    },
                    override_vim_notify = true,
                    -- not used for now as setting these can cause view problems
                    -- TODO: check if align = bottom-left + wrap + [LEVEL] message
                    -- could be implemented in fidget.nvim (like noice.nvim/mini)
                    -- window = {
                    --     max_width = math.floor(vim.o.columns * 0.33), -- Maximum width of the notification window
                    --     max_height = math.floor(vim.o.lines * 0.5), -- Maximum height of the notification window
                    --     x_padding = 1,    -- Padding from right edge of window boundary
                    --     y_padding = 0,    -- Padding from bottom edge of window boundary
                    -- }
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
}
