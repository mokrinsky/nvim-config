local M = {
  'folke/which-key.nvim',
  lazy = false,
}

function M.config()
  require('which-key').setup {}
end

return M
