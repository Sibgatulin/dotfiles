vim.g.termguicolors = true

local M = {}

function M.baby()
  local config = require "gruvbox-baby.config"
  local colors = require "gruvbox-baby.colors"
  local c = colors.config(config)
  vim.g.gruvbox_baby_highlights = {
    SpellBad = { sp = c.red, style = "undercurl" },
    SpellCap = { sp = c.bright_yellow, style = "undercurl" },
    SpellLocal = { sp = c.bright_yellow, style = "undercurl" },
    SpellRare = { sp = c.bright_yellow, style = "undercurl" },
    Underlined = { sp = c.error_red, style = "undercurl" },
    Search = { fg = c.none, bg = c.comment },
    IncSearch = { fg = c.none, bg = c.forest_green },
  }
  vim.cmd [[colorscheme gruvbox-baby]]
end

M.baby()
