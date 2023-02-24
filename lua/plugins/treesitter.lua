local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  dependencies = {
    'p00f/nvim-ts-rainbow',
    'windwp/nvim-ts-autotag',
    'windwp/nvim-autopairs',
    'nvim-treesitter/playground',
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
    ensure_installed = require('config').treesitter_ensure_installed,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        if vim.bo.filetype == 'yaml.ansible' then
          return true
        end
        return false
      end,
      additional_vim_regex_highlighting = { 'org' },
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    autotag = {
      enable = true,
    },
  }

  require('nvim-treesitter.configs').setup(options)
  require('nvim-autopairs').setup {}
end

return M
