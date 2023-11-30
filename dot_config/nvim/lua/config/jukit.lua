local M = {}

function M._open_output_in_selected_venv(current_venv_path)
  local cmd = [[JukitOut source ]] .. current_venv_path .. [[/bin/activate]]
  vim.cmd(cmd)
end

function M.JukitStartInVenv(in_new_window)
  -- allowing me to bind two different keymaps to opening in a new split or a window
  vim.g.jukit_output_new_os_window = (in_new_window and 1) or 0
  vim.g.jukit_shell_cmd = vim.fn.expand("~/.local/bin/ptip")

  local current_venv_path = os.getenv("VIRTUAL_ENV")
  if current_venv_path ~= nil then
    M._open_output_in_selected_venv(current_venv_path)
  else
    print("No venv activated. Select and try again")
  end
end
return M
