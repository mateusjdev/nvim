-- Toogle diagnostics
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
    noremap = true,
    silent = true,
    desc = "Toggle Diagnostics"
})

vim.keymap.set('n', '<leader>ti', vim.cmd.IBLToggle, {
    desc = "Toggle IBL"
})

vim.keymap.set('n', '<leader>tf', ":Neotree toggle<CR>", {
    desc = "Toggle Neotree"
})

vim.keymap.set('n', '<leader>tr', vim.cmd.TroubleToggle, {
    desc = "Toggle Trouble"
})

vim.keymap.set('n', '<leader>tco', vim.cmd.ColorizerToggle, {
    desc = "Toggle Colorizer"
})

vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, {
    desc = "Toggle Undotree"
})

-- non plugins
-- default disabled
vim.keymap.set('n', '<leader>ts', function ()
    vim.opt.spell = not(vim.opt.spell:get())
end, {
    desc = "Toggle spellcheck"
})

-- default disabled
vim.keymap.set('n', '<leader>tch', function ()
    vim.opt.list = not(vim.opt.list:get())
end, {
    desc = "Toggle listchars"
})
