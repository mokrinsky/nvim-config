local M = {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'cljoly/telescope-repo.nvim',
  },
}

function M.config()
  local actions = require 'telescope.actions'

  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-up>'] = actions.preview_scrolling_up,
          ['<C-down>'] = actions.preview_scrolling_down,
        },
        n = {
          ['<C-up>'] = actions.preview_scrolling_up,
          ['<C-down>'] = actions.preview_scrolling_down,
        },
      },
    },
    extensions = {
      repo = {
        list = {
          fd_opts = {
            '--no-ignore-vcs',
          },
          search_dirs = {
            '~/git',
          },
        },
      },
    },
  }

  require('telescope').load_extension 'repo'
end

return M
