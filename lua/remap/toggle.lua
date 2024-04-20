-- Toogle diagnostics
-- Check need to move to remap/lsp
local diagnostics_active = true
local toggle_diagnostics = function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
        vim.diagnostic.enable()
    else
        vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
        vim.diagnostic.disable()
    end
end

vim.keymap.set('n', '<leader>td', toggle_diagnostics, {
    desc = "Toggle Diagnostics"
})

-- plugins/highlight/ibl
vim.keymap.set('n', '<leader>ti', vim.cmd.IBLToggle, {
    desc = "Toggle IBL"
})

-- plugins/ui/neo-tree
vim.keymap.set('n', '<leader>tf', ":Neotree toggle<CR>", {
    desc = "Toggle Neotree"
})

-- plugins/highlight/colorizer
-- TODO: disable colorizer by default
vim.keymap.set('n', '<leader>tco', vim.cmd.ColorizerToggle, {
    desc = "Toggle Colorizer"
})

-- plugins/extra/undotree
vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, {
    desc = "Toggle Undotree"
})

-- non plugins
-- default disabled
vim.keymap.set('n', '<leader>ts', function ()
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.opt.spell = not(vim.opt.spell:get())
end, {
    desc = "Toggle spellcheck"
})

-- default disabled
vim.keymap.set('n', '<leader>tch', function ()
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.opt.list = not(vim.opt.list:get())
end, {
    desc = "Toggle listchars"
})
