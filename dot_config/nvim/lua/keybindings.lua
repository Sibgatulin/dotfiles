local opts = { noremap = true }
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
vim.keymap.set("v", "p", '"_dP', opts) -- keep yanked in the register after pasting
vim.keymap.set("n", "<leader>c", "<cmd>TSContextToggle<cr>", opts)
vim.keymap.set("n", "<leader>cfp", "<cmd>let @+ = expand('%:p')<cr>", opts)

-- Remap for dealing with word wrap -- the best!
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
--
-- Buffer navigation using barbar
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>", opts)
vim.keymap.set("n", "<A-p>", ":BufferPin<CR>", opts)
vim.keymap.set("n", "<A-c>", ":BufferClose<CR>", opts)
vim.keymap.set("n", "<A-s>", ":BufferPick<CR>", opts)

-- More leader based mappings
local wk = require "which-key"

wk.register({
  e = {
    name = "NvimTree",
    t = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle" },
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
  p = {
    name = "pandoc",
    d = { "<cmd>Pandoc pdf -F pandoc-crossref --citeproc<CR>", "compile" },
    D = { "<cmd>Pandoc! pdf -F pandoc-crossref --citeproc<CR>", "compile & open" },
  },
  d = {
    name = "diagnostic",
    t = { "<cmd>ToggleDiag<cr>", "toggle" },
  },
}, { prefix = "<leader>" })
