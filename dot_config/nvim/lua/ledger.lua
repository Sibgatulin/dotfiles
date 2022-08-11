vim.g.ledger_default_commodity = "EUR"
vim.g.ledger_commodity_sep = " "
vim.g.ledger_commodity_before = 0

-- TODO: can I port the function to Lua?
vim.cmd [[
  function LedgerSort()
      :%!hledger -f - print
      :%LedgerAlign
  endfunction
  command LedgerSort call LedgerSort()

  augroup Ledger
    autocmd BufWritePre *.ledger execute ':%LedgerAlign'
    autocmd BufWritePre journal.ledger execute ':LedgerSort'
  augroup end
]]
