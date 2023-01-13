vim.g.jukit_output_new_os_window = 1
vim.g.jukit_ipython = 0
-- following script is required, as ptipython, contrary to ipython, does not seem
-- to accept -c <code>.
-- TODO: consider adding ipython magic and hooks from about
--  vim-jukit/autoload/jukit/splits.vim:258
vim.g.jukit_shell_cmd = vim.fn.expand "~/bin/jukit_cmd"
-- the following is not really needed as it cannot be used by ptipython anyway
-- (and instead is hard-coded in the script mentioned above)
vim.g.jukit_custom_backend = "matplotlib-backend-kitty"

local M = {}

-- function M._get_env()
--   local current_venv_path = os.getenv "VIRTUAL_ENV"
--   if current_venv_path ~= nil then
--     return current_venv_path
--   else
--     require("swenv.api").pick_venv()
--     local selected_venv_path = os.getenv "VIRTUAL_ENV"
--     assert(selected_venv_path ~= nil, "Must select a venv. Aborting")
--     return selected_venv_path
--   end
-- end

function M._open_output_in_selected_venv(current_venv_path)
  local cmd = [[JukitOut source ]] .. current_venv_path .. [[/bin/activate]]
  vim.cmd(cmd)
end

function M.JukitStartInVenv()
  local current_venv_path = os.getenv "VIRTUAL_ENV"
  if current_venv_path ~= nil then
    M._open_output_in_selected_venv(current_venv_path)
  else
    print "No venv activated. Select and try again"
  end
end
return M
