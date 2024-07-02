local M = {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
}

function M.config()
  require('gitsigns').setup {
    watch_gitdir = {
      follow_files = false,
    },
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '-' },
      topdelete = { text = '-' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
  }
end

return M
