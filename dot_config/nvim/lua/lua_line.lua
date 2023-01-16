local gps = require "nvim-gps"

require("lualine").setup {
  options = { globalstatus = true },
  sections = {
    lualine_b = { "branch", "diff", "swenv" },
    lualine_c = {
      "filename",
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "diagnostics",
      {
        "encoding",
        cond = function()
          return vim.o.encoding ~= "utf-8"
        end,
      },
      {
        "fileformat",
        cond = function()
          return vim.bo.fileformat ~= "unix"
        end,
      },
      "filetype",
    },
  },
}
