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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "f3fora/cmp-spell"
  use "hrsh7th/cmp-nvim-lua"
  use "jc-doyle/cmp-pandoc-references"
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- }
  -- use { 'mhartington/formatter.nvim' }
  -- use "ludovicchabant/vim-gutentags"
  use {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    config = function()
      require("toggle_lsp_diagnostics").init()
    end,
  }

  -- Treesitter based
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use {
    "lewis6991/spellsitter.nvim",
    config = function()
      require("spellsitter").setup()
    end,
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"
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

  -- Vim specific
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
  }
  use "ellisonleao/gruvbox.nvim"
  use "luisiacc/gruvbox-baby"

  use "folke/which-key.nvim"
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
    "b0o/incline.nvim",
    config = function()
      require("incline").setup {
        hide = {
          only_win = true,
        },
      }
    end,
  }
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
  use "stevearc/dressing.nvim"
  use "mhartington/formatter.nvim"

  -- Git
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
  use "tpope/vim-fugitive"
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- let's see if I want it:
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use "rhysd/committia.vim"
  use "junegunn/gv.vim"

  -- Utilities
  use "mbbill/undotree"
  use "junegunn/fzf.vim"
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  } -- "gc" to comment visual regions/lines
  use {
    "lewis6991/impatient.nvim",
    config = function()
      require "impatient"
    end,
  }

  -- Python
  use {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup {
        -- Path passed to `get_venvs`.
        venvs_path = "/data/venvs",
        post_set_venv = function()
          vim.cmd [[:LspRestart]]
        end,
      }
    end,
  }
  use {
    "luk400/vim-jukit",
    -- tag = "v0.1.0",
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
