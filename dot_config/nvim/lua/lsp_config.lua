-- Mappings.
local keymap = vim.api.nvim_set_keymap
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  if client.name == 'pyright' then
    -- leave this to jedi
    client.resolved_capabilities.hover = false
  end
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local nvim_lsp = require('lspconfig')

local servers = { 'pyright', 'jedi_language_server', 'sumneko_lua', "bashls", "jsonls" }

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.sumneko_lua.setup {
  settings = {
    Lua = {
     diagnostics = {
       -- Get the language server to recognize the `vim` global
       globals = {'vim', 'use'},
     },
     workspace = {
       -- Make the server aware of Neovim runtime files
       library = vim.api.nvim_get_runtime_file("", true),
     },
     -- Do not send telemetry data containing a randomized but unique identifier
     telemetry = { enable = false },
    }
  }
}
