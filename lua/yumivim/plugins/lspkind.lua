local M = { 'onsails/lspkind.nvim' }

function M.config()
  local config = require('yumivim.config').lsp_config
  require('lspkind').init(config)
end

return M
