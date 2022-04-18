local nls = require "null-ls"
local formatting = nls.builtins.formatting

sources = {
  formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
  },
  formatting.fixjson,
  formatting.isort,
  -- formatting.black, -- cannot make it work in a virtual environment
  formatting.shfmt,
}

nls.setup {
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
              augroup LspFormatting
                  autocmd! * <buffer>
                  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
              augroup END
              ]]
    end
  end,
  -- log = { enable = ture, level = "debug" },
}
