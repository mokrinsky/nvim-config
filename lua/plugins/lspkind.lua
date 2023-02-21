local M = { 'onsails/lspkind.nvim' }

function M.config()
  local config = require('config').lsp_config
  require('lspkind').init(config)
end

return M
