vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,lspinfo nnoremap <silent> <buffer> q :close<CR>
  augroup end
  augroup TrailingSpaces
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup end
  augroup PythonAutoformat
    autocmd!
    autocmd BufWritePre *.py %s/\n\n# In\[[0-9]\+]:\n\n//e
    autocmd BufWritePre *.py execute ':Black'
  augroup end
]]
