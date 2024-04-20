-- plugins/lsp/toggleterm
vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm, {
    desc = "Toggle Terminal"
})

--- plugins/lspt/trouble
vim.keymap.set('n', '<leader>tr', vim.cmd.TroubleToggle, {
    desc = "Toggle Trouble"
})

-- plugins/lspt/fugitive
vim.keymap.set("n", "<leader>gi", vim.cmd.Git, {
    desc = "Open Git"
})

local function quickfix()
    vim.lsp.buf.code_action({
        -- filter = function(a) return a.isPreferred end,
        -- apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })
