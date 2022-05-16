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
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "f3fora/cmp-spell"
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
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  }

  -- Git
  use "tpope/vim-fugitive"
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- let's see if I want it:
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  }
  use "rhysd/committia.vim"
  use "junegunn/gv.vim"

  -- Utilities
  use "junegunn/fzf.vim"
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  } -- "gc" to comment visual regions/lines

  -- Python
  use "psf/black"
  use {
    "luk400/vim-jukit",
    tag = "v0.1.0",
    config = function()
      vim.g.jukit_enable_text_syntax_hl = "" -- otherwise code is misinterpreted as text
    end,
  }

  -- Specific files
  use "ledger/vim-ledger"
  use {
    "vim-pandoc/vim-pandoc",
    config = function()
      vim.cmd [[
        let g:pandoc#formatting#mode = "sA"
        let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
      ]]
    end,
  }
  use "vim-pandoc/vim-pandoc-syntax"
  use {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim",
  }
end)
