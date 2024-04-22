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
    }
}
