require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "sumneko_lua",
    "bashls",
    "pyright",
    "jedi_language_server",
    "jsonls",
    "taplo",
  },
}
