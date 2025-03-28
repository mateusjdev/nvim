local utils = require("utils")

return {
    -- TODO: Replace with https://github.com/folke/lazydev.nvim
    -- folke/neodev.nvim
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
        keys = {
            {
                "<leader>pm",
                vim.cmd.Mason,
                desc = "Open Mason"
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            -- check dependencies and enable handler if possible
            local ensure_installed = { "lua_ls" }
            if utils.hasExecuTable("npm") then
                table.insert(ensure_installed, "ts_ls")
                table.insert(ensure_installed, "pyright")
                table.insert(ensure_installed, "yamlls")
                table.insert(ensure_installed, "html")
            end

            -- TODO: Check if it will be installed correctly in a new environment:
            -- clangd - unzip, clangd
            -- gopls - gopls

            require('mason-lspconfig').setup({
                ensure_installed = ensure_installed,
                -- TODO: Add a generic handler?
                handlers = {},
            })
        end
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    -- Accept currently selected item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                }),
                -- TODO: User https://github.com/echasnovski/mini.snippets
                -- https://github.com/hrsh7th/nvim-cmp/blob/1e1900b0769324a9675ef85b38f99cca29e203b3/README.md?plain=1#L77
                -- snippet = {}
            })
        end
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        lazy = true,
        event = 'LspAttach',
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
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim'
        }
    }
}
