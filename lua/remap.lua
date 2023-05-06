vim.g.mapleader = " "

function change_dir(_dir)
  vim.cmd.cd(_dir)
  print(vim.fn.getcwd())
end

vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- open netrw
vim.keymap.set({"n", "i"}, "<C-s>", vim.cmd.write) -- Ctrl + S to save
vim.keymap.set("n", "<leader>w", vim.cmd.bdelete) -- close buffer
vim.keymap.set('n', '<leader>cr', function () change_dir("%:h") end)
vim.keymap.set('n', '<leader>ch', function () change_dir("~/") end)
vim.keymap.set('n', '<leader>cg', function () change_dir("~/.config/nvim/") end)

-- telescope
local telescope_cmd = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_cmd.find_files, {})
vim.keymap.set('n', '<C-o>', telescope_cmd.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_cmd.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_cmd.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_cmd.help_tags, {})

-- which-key
require("which-key").register({
  f = {
    name = "files", -- optional group name
    f = { "Find File" }, -- create a binding with label
    g = { "Live Greap" }, -- create a binding with label
  },
}, { prefix = "<leader>" })
