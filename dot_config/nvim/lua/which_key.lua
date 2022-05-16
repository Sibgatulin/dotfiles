require("which-key").setup {
  plugins = {
    spelling = {
      enabled = true,
    },
    registers = false, -- the popup flickers on "+
  },
}
