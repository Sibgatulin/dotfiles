-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_create_user_command("YankFullPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard')
end, {})

vim.keymap.set(
  "n",
  "<leader>fy",
  [[<cmd>YankFullPath<cr>]],
  { desc = "Yank current buffer's full path to the clipboard" }
)
