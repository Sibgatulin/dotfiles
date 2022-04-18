local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
vim.g.mapleader = " "

keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("v", "p", '"_dP', opts) -- keep yanked in the register after pasting
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- More leader based mappings
local wk = require "which-key"

wk.register({
  e = {
    name = "NvimTree",
    t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
    f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
  },
  f = {
    name = "fzf",
    r = { "<cmd>Rg<cr>", "Rg" },
    f = { "<cmd>Files<cr>", "Files" },
    b = { "<cmd>Buffers<cr>", "Buffers" },
  },
  t = {
    name = "truble",
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    t = { "<cmd>TroubleToggle<cr>", "toggle" },
    c = { "<cmd>TodoTrouble<cr>", "todo-comments" },
  },
}, { prefix = "<leader>" })
