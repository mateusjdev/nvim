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
local utils = require("utils")

-- TODO: store flags in config
ENABLE_LSP = vim.loop.os_uname().machine ~= 'aarch64' -- disable lsp on arm devices
ENABLE_TREESITTER = utils.hasExecuTable({ vim.fn.getenv("CC"), "cc", "gcc", "clang", "cl", "zig" })
ENABLE_RIPGREP = utils.hasExecuTable({ "rg" })

-- load plugins list
require("lazy").setup(
-- plugins
    {
        { import = 'plugins.core' },
        { import = 'plugins.ui' },
        { import = 'plugins.format' },
        { import = 'plugins.highlight' },
        -- TODO: add toggle to enable LSP if needed
        { import = 'plugins.lsp',      cond = ENABLE_LSP },
        { import = 'plugins.lspt',     cond = ENABLE_LSP },
        { import = 'plugins.extra' },
    },
    -- opts
    {
        change_detection = {
            enabled = false,
            notify = false,
        }
    }
)

if not ENABLE_TREESITTER then
    vim.notify("No compilers found, disabling treesitter", vim.log.levels.WARN)
end

require("keymaps")
require("autocmd")

