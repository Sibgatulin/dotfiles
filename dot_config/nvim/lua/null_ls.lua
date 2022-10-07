local nls = require "null-ls"
local formatting = nls.builtins.formatting
-- local diagnostics = nls.builtins.diagnostics

local sources = {
  formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
  },
  -- formatting.fixjson, -- would like to configure array splitting
  formatting.prettier,
  formatting.isort,
  formatting.shfmt,
  formatting.black, -- did it just start working well?

  -- diagnostics.markdownlint,
}
-- formatting.black, -- cannot make it work in a virtual environment

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  -- you can reuse a shared lspconfig on_attach callback here
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use
          vim.lsp.buf.format { bufnr = bufnr }
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
