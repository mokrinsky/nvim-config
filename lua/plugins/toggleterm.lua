local M = {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
}

function M.config()
  require('toggleterm').setup {
    direction = 'float',
    on_open = function(terminal)
      local nvimtree = require 'nvim-tree'
      local nvimtree_view = require 'nvim-tree.view'
      if nvimtree_view.is_visible() and terminal.direction == 'horizontal' then
        local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
        nvimtree.toggle()
        nvimtree_view.View.width = nvimtree_width
        nvimtree.toggle(false, true)
      end
    end,
  }
end

return M
