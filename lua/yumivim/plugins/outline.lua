local M = {
  'simrat39/symbols-outline.nvim',
  lazy = true,
  cmd = 'SymbolsOutline',
}

function M.config()
  local outline = require 'symbols-outline'

  outline.setup {
    show_guides = true,
    relative_width = false,
    width = 40,
    symbols = {
      File = { icon = ' ', hl = '@text.uri' },
      Module = { icon = ' ', hl = '@namespace' },
      Namespace = { icon = ' ', hl = '@namespace' },
      Package = { icon = ' ', hl = '@namespace' },
      Class = { icon = 'ﴯ ', hl = '@type' },
      Method = { icon = ' ', hl = '@method' },
      Property = { icon = ' ', hl = '@method' },
      Field = { icon = ' ', hl = '@field' },
      Constructor = { icon = ' ', hl = '@constructor' },
      Enum = { icon = 'ℰ', hl = '@type' },
      Interface = { icon = 'ﰮ ', hl = '@type' },
      Function = { icon = ' ', hl = '@function' },
      Variable = { icon = ' ', hl = '@constant' },
      Constant = { icon = ' ', hl = '@constant' },
      String = { icon = ' ', hl = '@string' },
      Number = { icon = ' ', hl = '@number' },
      Boolean = { icon = '⊨', hl = '@boolean' },
      Array = { icon = ' ', hl = '@constant' },
      Object = { icon = ' ', hl = '@type' },
      Key = { icon = ' ', hl = '@type' },
      Null = { icon = 'NULL', hl = '@type' },
      EnumMember = { icon = ' ', hl = '@field' },
      Struct = { icon = 'פּ ', hl = '@type' },
      Event = { icon = '', hl = '@type' },
      Operator = { icon = ' ', hl = '@operator' },
      TypeParameter = { icon = ' ', hl = '@parameter' },
    },
  }

  vim.api.nvim_create_autocmd('CursorMoved', {
    pattern = '*',
    callback = function()
      outline._highlight_current_item(nil)
    end,
  })
end

return M
