-- plugins/barbar
vim.keymap.set('n', '<leader>bn', vim.cmd.BufferPrevious, {
    desc = "Previous Buffer"
})
vim.keymap.set('n', '<leader>bN', vim.cmd.BufferNext, {
    desc = "Next Buffer"
})
vim.keymap.set('n', '<leader>bd', vim.cmd.BufferClose, {
    desc = "Close Buffer"
})
vim.keymap.set('n', 'ZC', vim.cmd.BufferClose, {
    desc = "Close Buffer"
})

-- close buffer
vim.keymap.set("n", "<leader>w", vim.cmd.BufferClose, {
    desc = "Close buffer"
})

vim.keymap.set("n", "<C-w", vim.cmd.BufferClose, {
    desc = "Close buffer"
})

-- SudaWrite
vim.keymap.set('n', '<leader>ssw', vim.cmd.SudaWrite, {
    desc = "Write as sudo"
})

-- fugitive
vim.keymap.set("n", "<leader>gi", vim.cmd.Git)

-- lualine
-- Toogle diagnostics
local full_path = false
local toggle_full_path = function()
    full_path = not full_path
    if full_path then
        require('lualine').setup {
            sections = { lualine_c = { { 'filename', path = 3 } } }
        }
    else
        require('lualine').setup {
            sections = { lualine_c = { { 'filename' } } }
        }
    end
end

vim.keymap.set('n', '<leader>tp', toggle_full_path, {
    noremap = true,
    silent = true,
    desc = "Toggle full path"
})

-- telescope
local telescope = require('telescope')
local telescope_cmd = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_cmd.find_files, {
    desc = "Find files"
})
vim.keymap.set('n', '<C-o>', telescope_cmd.find_files, {
    desc = "Find files"
})
vim.keymap.set('n', '<leader>fg', telescope_cmd.live_grep, {
    desc = "Grep"
})
vim.keymap.set('n', '<leader>f"', telescope.extensions.register_preview.registers, {
    desc = "Registers"
})
vim.keymap.set('n', '<leader>fb', telescope_cmd.buffers, {
    desc = "Buffers"
})
vim.keymap.set('n', '<leader>fh', telescope_cmd.help_tags, {
    desc = "Help tags"
})
