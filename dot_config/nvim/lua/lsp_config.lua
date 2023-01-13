-- require("nvim-lsp-installer").setup {
--   automatic_installation = true,
-- }
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true } -- kickstart.nvim doesn't use it...
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local nvim_lsp = require "lspconfig"
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  if client.name == "pyright" then
    -- leave this to jedi
    client.server_capabilities.hover = false
  end
  -- client.server_capabilities.document_formatting = false
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "KK", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = { "bashls", "jsonls", "jedi_language_server" }
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp["pyright"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- want to find a way to toggle it somehow...
        -- typeCheckingMode = "off", -- want to find a way to toggle it somehow...
      },
    },
  },
}

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "use" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  })
