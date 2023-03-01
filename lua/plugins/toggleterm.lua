local M = {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
}

function M.config()
  require('toggleterm').setup {
    direction = 'float',
  }
end

return M
