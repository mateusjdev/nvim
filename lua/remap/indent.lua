-- TODO: find a plugin to solve this
vim.keymap.set('n', '<leader>pic', function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 0
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = false
    vim.opt.smartindent = false
end, {
    desc = "Set Indent to C"
})

vim.keymap.set('n', '<leader>pil', function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.smartindent = true
end, {
    desc = "Set Indent to lua"
})

vim.keymap.set('n', '<leader>pir', function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
end, {
    desc = "Set Indent to user default"
})

vim.keymap.set('n', '<leader>pid', function()
    vim.opt.tabstop = 8
    vim.opt.softtabstop = 0
    vim.opt.shiftwidth = 8
    vim.opt.expandtab = false
    vim.opt.smartindent = false
end, {
    desc = "Set Indent to nvim default"
})
