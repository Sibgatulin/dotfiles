-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.colorcolumn = "88" -- has to be a string...

-- see :h python-virtualenv
-- the global environmant has pynvim thanks to pacman -S python-neovim
vim.g.python3_host_prog = "/usr/bin/python"
