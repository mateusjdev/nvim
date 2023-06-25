vim.g.mapleader = " "

local function change_dir (newdir)
  vim.cmd.cd(newdir)
  print(vim.fn.getcwd())
end

vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- open netrw
vim.keymap.set({"n", "i"}, "<C-s>", vim.cmd.write) -- Ctrl + S to save
vim.keymap.set("n", "<leader>w", vim.cmd.bdelete) -- close buffer
vim.keymap.set('n', '<leader>cr', function () change_dir("%:h") end)
vim.keymap.set('n', '<leader>ch', function () change_dir("~/") end)
vim.keymap.set('n', '<leader>cg', function () change_dir("~/.config/nvim/") end)
vim.keymap.set('n', '<leader>cs', ':!md5sum %<cr>')
vim.keymap.set('v', '<leader>cs', ':\'<,\'>:w !md5sum<cr>')
