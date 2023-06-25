-- load packer.nvim
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    require('packer').sync()
end

-- load settings
require("remap")
require("settings")

-- load plugins
require("plugins")

-- load theme
vim.cmd[[colorscheme tokyonight]]
