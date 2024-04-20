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

vim.keymap.set('n', '<leader>qf', function()
    vim.lsp.buf.code_action()
end, {
    desc = "Show quickfix list"
})
