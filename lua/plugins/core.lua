return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
        end,
        opts = {}
    },
    {
        "lambdalisue/suda.vim",
        lazy = true,
        keys = {
            -- TODO: use a plugin to show a confirmation dialog
            {
                "<leader>ssw",
                vim.cmd.SudaWrite,
                desc = "Write as sudo"
            }
        }
    },
}
