return {
  {
    "AckslD/swenv.nvim",
    ft = "python",
    opts = {
      -- Path passed to `get_venvs`.
      venvs_path = "/data/venvs/p311/",
      post_set_venv = function()
        vim.cmd [[:LspRestart]]
      end,
    },
    keys = {
      {
        "<leader>ve",
        "<cmd>lua require('swenv.api').pick_venv()<cr>",
        desc = "Choose venv",
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = { venvwrapper_path = "/data/venvs/py311" },
  },
  {
    "luk400/vim-jukit",
    config = function()
      -- FIX: following must be fixed, as ptipython does not accept -c -i ... + venvs...
      vim.g.jukit_shell_cmd =
        "ptipython --config-file /home/renat/.config/ptpython/config-pastemode.py"
      vim.g.jukit_terminal = "kitty"
      vim.g.jukit_ipython = 0
      vim.g.jukit_mappings = 0
      vim.g.jukit_output_new_os_window = 1
      vim.g.jukit_save_output = 0
      vim.g.jukit_mappings_ext_enabled = { "py", "sh" }
      vim.g.jukit_hl_ext_enabled = { "py", "sh" }
    end,
    ft = { "py" }, -- otherwise cell separators won't be highlighted until a keymap is used
    keys = {
      {
        "<leader>jww",
        [[<cmd>lua require("config.jukit").JukitStartInVenv(true)<cr>]],
        desc = "Open python REPL in new window",
      },
      {
        "<leader>jws",
        [[<cmd>lua require("config.jukit").JukitStartInVenv(false)<cr>]],
        desc = "Open python REPL in new split",
      },
      { "<leader>jwt", "<cmd>call jukit#splits#term()<cr>", desc = "Open shell" },
      {
        "<leader>jwc",
        "<cmd>call jukit#splits#close_output_split()<cr>",
        desc = "Close outputs",
      },
      {
        "<leader>jsc",
        "<cmd>call jukit#send#section(0)<cr>",
        desc = "Send current cell",
      },
      { "<leader>jsl", "<cmd>call jukit#send#line()<cr>", desc = "Send current line" },
      {
        "<leader>jst",
        "<cmd>call jukit#send#unti_current_section()<cr>",
        desc = "Send all until the current cell",
      },
      { "<leader>jsa", "<cmd>call jukit#send#all()<cr>", desc = "Send all" },
      {
        "<leader>js",
        "<cmd>call jukit#send#selection()<cr>",
        desc = "Send current selection",
        mode = "v",
      },
      {
        "<leader>jcs",
        "<cmd>call jukit#cells#split()<cr>",
        desc = "Split current cell",
      },
      {
        "<leader>jco",
        "<cmd>call jukit#cells#create_below(0)<cr>",
        desc = "New code cell below",
      },
      {
        "<leader>jcO",
        "<cmd>call jukit#cells#create_above(0)<cr>",
        desc = "New code cell above",
      },
      {
        "<leader>jct",
        "<cmd>call jukit#cells#create_below(1)<cr>",
        desc = "New text cell below",
      },
      {
        "<leader>jcT",
        "<cmd>call jukit#cells#create_above(1)<cr>",
        desc = "New text cell above",
      },
      {
        "<leader>jcd",
        "<cmd>call jukit#cells#delete()<cr>",
        desc = "Delete current cell",
      },
      {
        "<leader>jcM",
        "<cmd>call jukit#cells#merge_above()<cr>",
        desc = "Merge current cell with cell above",
      },
      {
        "<leader>jcm",
        "<cmd>call jukit#cells#merge_below()<cr>",
        desc = "Merge current cell with cell below",
      },
      {
        "<leader>jcj",
        "<cmd>call jukit#splits#move_down()<cr>",
        desc = "Move current cell down",
      },
      {
        "<leader>jck",
        "<cmd>call jukit#splits#move_up()<cr>",
        desc = "Move current cell up",
      },
      {
        "<leader>jj",
        "<cmd>call jukit#cells#jump_to_next_cell()<cr>",
        desc = "Move to next cell",
      },
      {
        "<leader>jk",
        "<cmd>call jukit#cells#jump_to_previous_cell()<cr>",
        desc = "Move to previous cell",
      },
      {
        "<leader>jtn",
        "<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
        desc = "py <-> ipynb",
      },
      {
        "<leader>jth",
        "<cmd>call jukit#convert#save_nb_to_file(0,1,'html')<cr>",
        desc = "py -> html",
      },
      {
        "<leader>jtH",
        "<cmd>call jukit#convert#save_nb_to_file(0,1,'html')<cr>",
        desc = "py -> html",
      },
      {
        "<leader>jtp",
        "<cmd>call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>",
        desc = "py -> pdf",
      },
      {
        "<leader>jtP",
        "<cmd>call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>",
        desc = "py -[re-run]-> pdf",
      },
    },
  },
}
