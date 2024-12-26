local opt = vim.opt

-- opt.guicursor = ""

vim.g.mapleader = " "

opt.number = true         -- number of actual line
opt.relativenumber = true -- number of lines are relative to cursor line

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.encoding = "utf-8"
opt.clipboard = "unnamedplus" -- integrade yank register to keyboard register
opt.scrolloff = 6

opt.termguicolors = true
opt.modeline = true

opt.endofline = false
opt.listchars:append {
    space = "⋅",
    eol = "↴",
    tab = "-->"
}

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

-- Spelling
opt.spelllang = "pt_br,en"

-- Title
opt.title = true
-- TODO: change to path if in project/git repo
opt.titlestring = 'nvim %{expand("%:p:~")}'

opt.splitright = true
opt.splitbelow = true

opt.undofile = true

opt.breakindent = true
opt.showbreak = "    "
opt.linebreak = true

