local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPre',
}

function M.config()
  local blankline = require 'indent_blankline'
  blankline.setup {
    indentLine_enabled = 1,
    filetype_exclude = {
      'help',
      'terminal',
      'packer',
      'lspinfo',
      'TelescopePrompt',
      'TelescopeResults',
      'lsp-installer',
      'Outline',
      'NvimTree',
      'alpha',
      '',
    },
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    show_current_context = true,
    show_current_context_start = true,
  }
end

return M
