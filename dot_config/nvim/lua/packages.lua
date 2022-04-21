-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]]

require("packer").startup(function()
  use "wbthomason/packer.nvim"

  -- Languages and syntax
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup()
    end,
  }
  use "p00f/nvim-ts-rainbow"
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "ludovicchabant/vim-gutentags"

  -- Vim specific
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
  }
  use "ellisonleao/gruvbox.nvim"

  use "folke/which-key.nvim"
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }
  -- cannot decide if to use this or nvim-gps
  use "lewis6991/nvim-treesitter-context"
  use {
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
  }
  use "nvim-lualine/lualine.nvim" -- need to configure more
  -- use({ -- need to configure better
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs").setup()
  --   end,
  -- })
  use "ggandor/lightspeed.nvim"
  use "romgrk/barbar.nvim"
  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }

  -- Lua
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  }

  -- Utilities
  use "junegunn/fzf.vim"
  use "tpope/vim-fugitive"
  -- let's see if I want it:
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  }
  use "rhysd/committia.vim"
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  } -- "gc" to comment visual regions/lines

  -- Python
  use "psf/black"

  -- Specific files
  use "ledger/vim-ledger"
  use {
    "vim-pandoc/vim-pandoc",
    config = function()
      vim.cmd [[
        let g:pandoc#formatting#mode = "hA"
        let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
      ]]
    end,
  }
end)
