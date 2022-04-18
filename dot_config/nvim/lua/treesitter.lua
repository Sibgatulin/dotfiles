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
    "markdown",
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
