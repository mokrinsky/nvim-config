local M = {
  'echasnovski/mini.indentscope',
  event = { 'BufReadPre', 'BufNewFile' },
}

function M.config()
  local indentscope = require 'mini.indentscope'
  indentscope.setup {
    symbol = '│',
    options = { try_as_border = true },
  }
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end

return M
