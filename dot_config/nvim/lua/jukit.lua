vim.g.jukit_output_new_os_window = 1
vim.g.jukit_hl_ext_enabled = { "py" }
vim.g.jukit_ipython = 0
vim.g.jukit_mappings = 0

local M = {}

function M._open_output_in_selected_venv(current_venv_path)
  local cmd = [[JukitOut source ]] .. current_venv_path .. [[/bin/activate]]
  vim.cmd(cmd)
end

function M.JukitStartInVenv(gpu)
  -- I have not figured out how to pass arguments to scripts through jukit#splits#output
  -- thus I switch between different scripts in this function, depending on whether
  -- GPU is requested
  local cmd = (gpu and "optip") or "ptip"
  vim.g.jukit_shell_cmd = vim.fn.expand("~/bin/" .. cmd)
  --
  -- NOTE: consider adding to [o]ptip ipython magic and hooks from about
  --  vim-jukit/autoload/jukit/splits.vim:258

  local current_venv_path = os.getenv "VIRTUAL_ENV"
  if current_venv_path ~= nil then
    M._open_output_in_selected_venv(current_venv_path)
  else
    print "No venv activated. Select and try again"
  end
end
return M
