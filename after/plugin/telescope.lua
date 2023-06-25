local telescope_cmd = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_cmd.find_files, {})
vim.keymap.set('n', '<C-o>', telescope_cmd.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_cmd.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_cmd.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_cmd.help_tags, {})


-- which-key keybindings
require("which-key").register({
  f = {
    name = "files", -- optional group name
    f = { "Find File" }, -- create a binding with label
    g = { "Live Greap" }, -- create a binding with label
  },
}, { prefix = "<leader>" })

