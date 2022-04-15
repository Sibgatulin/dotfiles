vim.cmd("colorscheme gruvbox-material")

vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.spelllang = "en_gb"
vim.wo.spell = true

vim.g.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.undofile = true
vim.g.undodir = "~/.config/nvim/.undo/"
vim.g.directory = "~/.config/nvim/.swp/"
vim.g.backupdir = "~/.config/nvim/.backup/"
vim.g.laststatus = 3

vim.wo.colorcolumn = "88"
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.o.scrolloff = 5
