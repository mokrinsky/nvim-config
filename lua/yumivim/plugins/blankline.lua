local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
}

function M.config()
  local blankline = require 'ibl'
  blankline.setup {
    whitespace = { remove_blankline_trail = true },
    indent = { char = '│' },
    exclude = {
      buftypes = { 'terminal', 'nofile', 'prompt' },
      filetypes = {
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
    },
  }
  local hooks = require 'ibl.hooks'
  hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
end

return M
