local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'windwp/nvim-autopairs',
    'nvim-treesitter/playground',
    'HiPhish/nvim-ts-rainbow2',
  },
}

function M.config()
  local options = {
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
    ensure_installed = {
      'bash',
      'cmake',
      'cpp',
      'dockerfile',
      'fish',
      'go',
      'gomod',
      'html',
      'java',
      'javascript',
      'json',
      'kotlin',
      'lua',
      'markdown',
      'markdown_inline',
      'nix',
      'python',
      'regex',
      'sql',
      'typescript',
      'vim',
      'yaml',
    },
    highlight = {
      enable = true,
      disable = function()
        if vim.bo.filetype == 'yaml.ansible' then
          return true
        end
        return false
      end,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      query = 'rainbow-parens',
      strategy = require 'ts-rainbow.strategy.global',
    },
  }

  require('nvim-treesitter.configs').setup(options)
  require('nvim-autopairs').setup {}
end

return M
