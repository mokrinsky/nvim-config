local M = {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}

function M.config()
  local luasnip = require 'luasnip'
  require 'neogen'
  luasnip.config.setup {
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
  }
end

return M
