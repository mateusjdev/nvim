local utils = require("utils")

return {
    {
        "folke/neodev.nvim",
        enabled = true
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        keys = {
            {
                "<leader>pm",
                vim.cmd.Mason,
                desc = "Open Mason"
            }
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format({ details = true }),
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        lazy = true,
        opts = {
            highlight = true,
            separator = " " .. require("lualine").get_config().options.component_separators.left .. " "
        },
        config = function(_, opts)
            local status_line_bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
            local function adjust_bg(highlight)
                local highlight_fg = vim.api.nvim_get_hl(0, { name = highlight, link = false }).fg
                vim.api.nvim_set_hl(0, highlight, { default = false, bg = status_line_bg, fg = highlight_fg })
            end

            -- TODO: add color to blank items
            adjust_bg("NavicIconsFile")
            adjust_bg("NavicIconsModule")
            adjust_bg("NavicIconsNamespace")
            adjust_bg("NavicIconsPackage")
            adjust_bg("NavicIconsClass")
            adjust_bg("NavicIconsMethod")
            adjust_bg("NavicIconsProperty")
            adjust_bg("NavicIconsField")
            adjust_bg("NavicIconsConstructor")
            adjust_bg("NavicIconsEnum")
            adjust_bg("NavicIconsInterface")
            adjust_bg("NavicIconsFunction")
            adjust_bg("NavicIconsVariable")
            adjust_bg("NavicIconsConstant")
            adjust_bg("NavicIconsString")
            adjust_bg("NavicIconsNumber")
            adjust_bg("NavicIconsBoolean")
            adjust_bg("NavicIconsArray") -- !color
            adjust_bg("NavicIconsObject")
            adjust_bg("NavicIconsKey")
            adjust_bg("NavicIconsNull")
            adjust_bg("NavicIconsEnumMember")
            adjust_bg("NavicIconsStruct")
            adjust_bg("NavicIconsEvent")
            adjust_bg("NavicIconsOperator")
            adjust_bg("NavicIconsTypeParameter")
            adjust_bg("NavicText")
            adjust_bg("NavicSeparator")

            require("nvim-navic").setup(opts)
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            require("neodev").setup({})

            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            -- if you want to know more about mason.nvim
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            -- check dependencies and enable handler if possible
            local ensure_installed = { "lua_ls" }
            if utils.hasExecuTable("npm") then
                table.insert(ensure_installed, "ts_ls")
                table.insert(ensure_installed, "pyright")
                table.insert(ensure_installed, "yamlls")
                table.insert(ensure_installed, "html")
            end
            if utils.hasExecuTable("go") then
                table.insert(ensure_installed, "gopls")
            end
            -- TODO: check if has unzip dependency on windows
            if utils.hasExecuTable("unzip") and utils.hasExecuTable("clangd") then
                table.insert(ensure_installed, "clangd")
            end

            local lsp_config = require("lspconfig")

            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed,
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    lsp_zero.default_setup,

                    gopls = function()
                        lsp_config.gopls.setup({})
                    end,

                    ts_ls = function()
                        lsp_config.ts_ls.setup({})
                    end,

                    yamlls = function()
                        lsp_config.yamlls.setup({})
                    end,

                    html = function()
                        lsp_config.html.setup({})
                    end,

                    pyright = function()
                        lsp_config.pyright.setup({})
                    end,

                    clangd = function()
                        lsp_config.clangd.setup({
                            filetypes = { "c", "h", "cpp", "objc", "objcpp",
                                "cuda", "proto", "hpp" },
                        })
                    end,

                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        -- local lua_opts = lsp_zero.nvim_lua_ls()
                        -- require('lspconfig').lua_ls.setup(lua_opts)
                        lsp_config.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        unusedLocalExclude = { "_*" }
                                    }
                                }
                            }
                        })
                    end,
                }
            })
        end
    }
}
