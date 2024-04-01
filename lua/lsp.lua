-- TODO: Fix all of this mess and merge with plugins/lsp.lua

-- https://lsp-zero.netlify.app/v3.x/tutorial.html

require("neodev").setup({})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "tsserver", "clangd", "gopls", "lua_ls", "pyright" },
    handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
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
    },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
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
    })
})

local function quickfix()
    vim.lsp.buf.code_action({
        -- filter = function(a) return a.isPreferred end,
        -- apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })
