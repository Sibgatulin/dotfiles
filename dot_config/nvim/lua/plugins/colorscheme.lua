return {
  { "ellisonleao/gruvbox.nvim" },
  { "luisiacc/gruvbox-baby" },
  { "sainnhe/gruvbox-material" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-baby",
    },
  },
  -- Packer
  {
    "folke/styler.nvim",
    config = function()
      require("styler").setup({
        themes = {
          norg = { colorscheme = "gruvbox" },
        },
      })
    end,
  },
}
