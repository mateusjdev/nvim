-- TODO: add a plugin to switch through projects, folders or bookmarks
local function change_dir(newdir)
    vim.cmd.cd(newdir)
    vim.notify(vim.fn.getcwd())
end
vim.keymap.set("n", "<leader>cr", function() change_dir("%:h") end)
vim.keymap.set("n", "<leader>ch", function() change_dir("~/") end)
vim.keymap.set("n", "<leader>cg", function() change_dir("~/.config/nvim/") end)

-- Ctrl + S to save
vim.keymap.set({ "n", "i" }, "<C-s>", vim.cmd.write, {
    desc = "Save file"
})

vim.keymap.set("n", "<leader>uh", ":!md5sum %<cr>", {
    desc = "Calculate file md5sum"
})

vim.keymap.set("x", "<leader>uh", ":'<,'>:w !md5sum<cr>", {
    desc = "Calculate md5sum from visual selected"
})

-- other remaps
require("keymaps.toggle")
require("keymaps.plugins")
require("keymaps.indent")

if ENABLE_LSP then
    require("keymaps.lsp")
end
