-- vim.opt.guicursor = ""

vim.opt.number = true -- number of actual line
vim.opt.relativenumber = true -- number of lines are relative to cursor line

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus" -- integrade yank register to keyboard register
vim.opt.scrolloff = 6

vim.opt.termguicolors = true
vim.opt.modeline = false

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "tab:->"

vim.g.mapleader = " "

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
