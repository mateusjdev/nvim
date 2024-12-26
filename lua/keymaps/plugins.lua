local utils = require("utils")

-- plugins/lazy
vim.keymap.set("n", "<leader>pp", vim.cmd.Lazy, {
    desc = "Open Lazy"
})

-- plugins/ui/barbar (Buffer Management)
vim.keymap.set("n", "<leader>bN", vim.cmd.BufferPrevious, {
    desc = "Previous Buffer"
})
vim.keymap.set("n", "<leader>bn", vim.cmd.BufferNext, {
    desc = "Next Buffer"
})
vim.keymap.set("n", "<leader>bd", vim.cmd.BufferClose, {
    desc = "Close Buffer"
})
vim.keymap.set("n", "ZC", vim.cmd.BufferClose, {
    desc = "Close Buffer"
})
vim.keymap.set("n", "<C-w", vim.cmd.BufferClose, {
    desc = "Close buffer"
})

-- plugins/ui/lualine
--- Switch between displaying [file path] and [filename]
local lualine = require("lualine")
local full_path = false
vim.keymap.set("n", "<leader>tp", function()
    full_path = not full_path
    if full_path then
        lualine.setup {
            sections = { lualine_c = { { "filename", path = 3 } } }
        }
    else
        lualine.setup {
            sections = { lualine_c = { { "filename" } } }
        }
    end
    utils.notifyToggled("Full Path", full_path)
end, {
    desc = "Switch lualine:filename to full path"
})

-- plugins/ui/telescope
local telescope = require('telescope')
local telescope_cmd = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_cmd.find_files, {
    desc = "Find files"
})
vim.keymap.set("n", "<C-o>", telescope_cmd.find_files, {
    desc = "Find files"
})

if ENABLE_RIPGREP then
    vim.keymap.set("n", "<leader>fg", telescope_cmd.live_grep, {
        desc = "Grep files"
    })
else
    vim.keymap.set("n", "<leader>fg", function()
        utils.notifyUnavaliable("ripgrep")
    end, {
        desc = "which_key_ignore"
    })
end
vim.keymap.set("n", "<leader>f\"", telescope.extensions.register_preview.registers, {
    desc = "Find registers"
})
vim.keymap.set("n", "<leader>fb", telescope_cmd.buffers, {
    desc = "Find buffers"
})
vim.keymap.set("n", "<leader>fh", telescope_cmd.help_tags, {
    desc = "Search help tags"
})
vim.keymap.set("n", "<leader>fp", telescope_cmd.builtin, {
    desc = "Find Pickers"
})

-- attempt
local attempt = require('attempt')

vim.keymap.set('n', '<leader>ai', attempt.new_input_ext, {
    desc = "new attempt, inputing extension"
})
vim.keymap.set('n', '<leader>ad', attempt.delete_buf, {
    desc = "delete attempt from current buffer"
})
vim.keymap.set('n', '<leader>ac', attempt.rename_buf, {
    desc = "rename attempt from current buffer"
})
vim.keymap.set('n', '<leader>al', ':Telescope attempt<CR>', {
    desc = "search through attempts"
})
