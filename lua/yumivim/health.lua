local M = {}

function M.check()
  vim.health.report_start 'mokrinsky/yumivim'

  if vim.fn.has 'nvim-0.8.0' == 1 then
    vim.health.report_ok 'Using Neovim >= 0.8.0'
  else
    vim.health.report_error 'Neovim >= 0.8.0 is required'
  end
end

return M
