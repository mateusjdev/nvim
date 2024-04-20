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
            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                -- TODO: check dependencies and enable only possible
                -- - tsserver: npm
                -- - pyright: npm
                -- - gopls: go
                -- - lua_ls: ?
                -- - clangd: unzip
                -- ensure_installed = { "tsserver", "clangd", "gopls", "lua_ls", "pyright" },
                ensure_installed = { "lua_ls" },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    lsp_zero.default_setup,

                    gopls = function()
                        require('lspconfig').gopls.setup({})
                    end,

                    tsserver = function()
                        require('lspconfig').tsserver.setup({})
                    end,

                    yamlls = function()
                        require('lspconfig').yamlls.setup({})
                    end,

                    html = function()
                        require('lspconfig').html.setup({})
                    end,

                    pyright = function()
                        require('lspconfig').pyright.setup({})
                    end,

                    clangd = function()
                        require('lspconfig').clangd.setup({
                            filetypes = { "c", "h", "cpp", "objc", "objcpp", "cuda",
                                "proto", "hpp" },
                        })
                    end,

                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        -- local lua_opts = lsp_zero.nvim_lua_ls()
                        -- require('lspconfig').lua_ls.setup(lua_opts)
                        require('lspconfig').lua_ls.setup({
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
