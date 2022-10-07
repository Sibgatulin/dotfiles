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
    "norg",
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
  context_commentstring = {
    enable = true,
  },
}
-- ends up irritating me more
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
