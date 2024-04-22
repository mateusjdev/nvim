local utils = require("utils")

-- Toogle diagnostics
-- Check need to move to remap/lsp
local diagnostics_active = true
vim.keymap.set('n', '<leader>td', function ()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
    utils.notifyToggled("Disgnostics", diagnostics_active)
end, {
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
