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
-- IS_DESKTOP = os.getenv("XDG_SESSION_TYPE") == 'x11' or
--     os.getenv("XDG_SESSION_TYPE") == 'wayland'

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

require("remap") -- key remaps
require("autocmd")

if ENABLE_LSP then
    require("lsp")
end
