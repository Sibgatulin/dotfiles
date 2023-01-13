-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local util = require "formatter.util"
require("formatter").setup {
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- require("formatter.filetypes.lua").stylua,
      function()
        -- Full specification of configurations is down below and in Vim help files
        return {
          exe = "stylua",
          args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },

    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    toml = {
      require("formatter.filetypes.toml").taplo,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
