require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "python",
    "lua",
    "bash",
    "json",
    "yaml",
    "toml",
    "regex",
    "latex",
    "ledger",
    -- "markdown", -- swapped out for vim-pandoc-syntax
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
-- ends up irritating me more
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
