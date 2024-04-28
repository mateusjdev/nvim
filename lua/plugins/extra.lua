return {
    -- TODO: add keybind to load all of extras lazzy
    {
        "vimwiki/vimwiki",
        enabled = false
    },
    {
        "mbbill/undotree",
        lazy = false
    },
    {
        -- Check LazyLoad
        "otavioschwanck/arrow.nvim",
        lazy = true,
        event = "VeryLazy",
        opts = {
            show_icons = true,
            leader_key = ';',
            buffer_leader_key = 'm', -- Per Buffer Mappings
        }
    },
    {
        "simonefranza/nvim-conv",
        lazy = true,
        event = "VeryLazy"
    },
    -- TODO: remove when nvim --version > 0.10
    {
        "ojroques/nvim-osc52",
        enabled = ENABLE_OSC52,
        opts = {
            trim = false -- Trim surrounding whitespaces before copy
        },
        config = function(_, opts)
            local function copy(lines, _)
                require('osc52').copy(table.concat(lines, '\n'))
            end

            local function paste()
                return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
            end

            vim.g.clipboard = {
                name = 'osc52',
                copy = { ['+'] = copy, ['*'] = copy },
                paste = { ['+'] = paste, ['*'] = paste },
            }

            -- Now the '+' register will copy to system clipboard using OSC52
            vim.keymap.set('n', '<leader>c', '"+y')
            vim.keymap.set('n', '<leader>cc', '"+yy')

            require('osc52').setup(opts)
        end
    }
}
