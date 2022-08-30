vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,lspinfo nnoremap <silent> <buffer> q :close<CR>
  augroup end
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre * Format
  augroup end
  augroup CleanExportedJupyterNotebooks
    autocmd!
    autocmd BufWritePre *.py %s/\n\n# In\[[0-9]\+]:\n\n//e
  augroup end
]]
