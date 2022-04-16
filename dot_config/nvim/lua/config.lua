vim.g.backup = true
vim.g.undofile = true
vim.g.undodir = "~/.config/nvim/.undo/"
vim.g.directory = "~/.config/nvim/.swp/"
vim.g.backupdir = "~/.config/nvim/.backup/"
vim.g.laststatus = 3

vim.g.termguicolors = true
vim.cmd("colorscheme gruvbox-material")

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.spelllang = "en_gb"
vim.wo.spell = true

vim.wo.colorcolumn = "88"
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 5

-- By default title is off. Needed for detecting window as neovim instance (sworkstyle)
-- but still doesn't help
-- vim.g.title = true
-- vim.g.titlestring = "neovim"