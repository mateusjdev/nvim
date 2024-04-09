-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("settings") -- simple settings

ENABLE_LSP = vim.loop.os_uname().machine ~= 'aarch64'

local function has_compiler(executables)
    return vim.tbl_filter(function(c) ---@param c string
        return c ~= vim.NIL and vim.fn.executable(c) == 1
    end, executables)[1]
end

ENABLE_TREESITTER = has_compiler({ vim.fn.getenv "CC", "cc", "gcc", "clang", "cl", "zig" }) or false

-- load plugins list
require("lazy").setup({
    change_detection = { notify = false, },
    { import = 'plugins.core' },
    { import = 'plugins.ui' },
    { import = 'plugins.format' },
    { import = 'plugins.highlight' },
    { import = 'plugins.lsp',      cond = ENABLE_LSP },
    { import = 'plugins.extra' },
})

if not ENABLE_TREESITTER then
    vim.notify("No compilers found, disabling treesitter", vim.log.levels.INFO)
end

require("remap") -- key remaps
require("autocmd")

if ENABLE_LSP then
    require("lsp")
end
