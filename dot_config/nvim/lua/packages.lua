-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]]

require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "sainnhe/gruvbox-material"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'psf/black'
  use {
   'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
end)

