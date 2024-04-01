-- TODO: replace with another plugin for
-- favorite folders
local function change_dir(newdir)
    vim.cmd.cd(newdir)
    vim.notify(vim.fn.getcwd())
end

vim.keymap.set('n', '<leader>cr', function() change_dir("%:h") end)
vim.keymap.set('n', '<leader>ch', function() change_dir("~/") end)
vim.keymap.set('n', '<leader>cg', function() change_dir("~/.config/nvim/") end)

-- Ctrl + S to save
vim.keymap.set({ "n", "i" }, "<C-s>", vim.cmd.write)

vim.keymap.set('n', '<leader>gh', ':!md5sum %<cr>', {
    desc = "Calculate file md5sum"
})

vim.keymap.set('v', '<leader>uh', ':\'<,\'>:w !md5sum<cr>', {
    desc = "Calculate md5sum from selected"
})

-- other remaps
require("remap.toggle")
require("remap.plugins")
require("remap.settings")
