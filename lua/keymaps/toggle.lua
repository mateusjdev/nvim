local utils = require("utils")

-- Toogle diagnostics
-- Check need to move to remap/lsp
local diagnostics_active = true
vim.keymap.set('n', '<leader>td', function ()
    diagnostics_active = not diagnostics_active
    vim.diagnostic.enable(diagnostics_active)
    utils.notifyToggled("Disgnostics", diagnostics_active)
end, {
    desc = "Toggle Diagnostics"
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
