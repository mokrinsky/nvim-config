local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
}

function M.config()
  local blankline = require 'indent_blankline'
  blankline.setup {
    char = '│',
    filetype_exclude = {
      'help',
      'terminal',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
      'lsp-installer',
      'Outline',
      'neo-tree',
      'alpha',
      'lazy',
      'trouble',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

return M
