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

-- Move blocks in visual mode
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", opts)

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>Y", '"+Y', opts)

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

-- Undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", opts)

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
  v = {
    name = "swenv",
    e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose venv" },
  },
  j = {
    name = "jukit",
    w = {
      name = "Windows",
      p = {
        [[<cmd>lua require("jukit").JukitStartInVenv(false)<cr>]],
        "Start ptipython in current venv (w/o GPU)",
      },
      o = {
        [[<cmd>lua require("jukit").JukitStartInVenv(true)<cr>]],
        "Start ptipython in current venv (w/ GPU)",
      },
      s = { "<cmd>call jukit#splits#term()<cr>", "Open a new shell" },
      q = {
        "<cmd>call jukit#splits#close_output_and_history(1)<cr>",
        "Close all and ask",
      },
    },
    s = {
      name = "Send",
      c = { "<cmd>call jukit#send#section(0)<cr>", "Send the cell" },
      l = { "<cmd>call jukit#send#line()<cr>", "Send the line" },
      a = { "<cmd>call jukit#send#all()<cr>", "Execute all" },
    },
    c = {
      name = "Cell",
      o = { "<cmd>call jukit#cells#create_below(0)<cr>", "Create a code cell below" },
      O = { "<cmd>call jukit#cells#create_above(0)<cr>", "Create a code cell above" },
      t = { "<cmd>call jukit#cells#create_below(1)<cr>", "Create a text cell below" },
      T = { "<cmd>call jukit#cells#create_above(1)<cr>", "Create a text cell above" },
      d = { "<cmd>call jukit#cells#delete()<cr>", "Delete current cell" },
      s = { "<cmd>call jukit#cells#split()<cr>", "Split current cell" },
      M = { "<cmd>call jukit#cells#merge_above()<cr>", "Merge with the cell above" },
      m = { "<cmd>call jukit#cells#merge_below()<cr>", "Merge with the cell below" },
      k = { "<cmd>call jukit#cells#move_up()<cr>", "Move the cell up" },
      j = { "<cmd>call jukit#cells#move_down()<cr>", "Move the cell down" },
    },
    j = { "<cmd>call jukit#cells#jump_to_next_cell()<cr>", "Jump to the next cell" },
    k = {
      "<cmd>call jukit#cells#jump_to_previous_cell()<cr>",
      "Jump to the previous cell",
    },
    t = {
      name = "Convert to",
      n = {
        [[<cmd>call jukit#convert#notebook_convert("jupyter-notebook")<cr>]],
        ".ipynb <-> .py",
      },
      h = {
        [[<cmd>call jukit#convert#save_nb_to_file(0,1,"html")<cr>]],
        "as is -> .html",
      },
      H = {
        [[<cmd>call jukit#convert#save_nb_to_file(1,1,"html")<cr>]],
        "rerun -> .html",
      },
      p = {
        [[<cmd>call jukit#convert#save_nb_to_file(0,1,"pdf")<cr>]],
        "as is -> .pdf",
      },
      P = {
        [[<cmd>call jukit#convert#save_nb_to_file(1,1,"pdf")<cr>]],
        "rerun -> .pdf",
      },
    },
  },
}, { prefix = "<leader>" })
wk.register(
  { ["<leader>js"] = { "<cmd>call jukit#send#selection()<cr>", "Send selection" } },
  { mode = "v" }
)
