return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {},
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffView File Hist" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
    },
  },
  { "tpope/vim-fugitive" },
  { "rhysd/committia.vim" },
}
