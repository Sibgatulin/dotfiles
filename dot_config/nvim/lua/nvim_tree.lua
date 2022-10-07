require("nvim-tree").setup { -- BEGIN_DEFAULT_OPTS
  disable_netrw = true,
  -- hijack_cursor = true, -- not sure if important
  -- sort_by = "name", -- "modification_time" possible
  view = {
    width = 30,
    side = "right",
    preserve_window_proportions = false, -- wanted - resize rest on toggle
    number = true, -- wanted
    relativenumber = true, -- wanted
    signcolumn = "yes", -- let's see...
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "t", action = "tabnew" },
        { key = "s", action = "split" },
        { key = "o", action = "system_open" }, -- instead of overwritten s
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false, -- maybe
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {}, -- interesting
    exclude = {},
  },
  git = { -- mind g:nvim_tree_icons
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true, -- hmm, ok
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}
