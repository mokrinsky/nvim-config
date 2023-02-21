local M = {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
}

function M.config()
  local tree = require 'nvim-tree'
  tree.setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    sort_by = 'case_sensitive',
    view = {
      adaptive_size = true,
      side = 'left',
      signcolumn = 'yes',
      mappings = {
        list = {
          { key = 'u', action = 'dir_up' },
        },
      },
    },
    renderer = {
      symlink_destination = false,
      highlight_git = true,
      group_empty = true,
      indent_width = 2,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = '└',
          edge = '│',
          item = '│',
          bottom = '─',
          none = ' ',
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = 'signcolumn',
        padding = ' ',
        symlink_arrow = ' ➛ ',
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = '',
          symlink = '',
          bookmark = '',
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '',
            untracked = '',
            deleted = '✖',
            ignored = '',
          },
        },
      },
    },
  }
end

return M
