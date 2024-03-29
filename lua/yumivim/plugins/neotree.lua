local M = {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
}

function M.config()
  local config = {
    log_level = 'info',
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    use_default_mappings = false,
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    window = {
      position = 'float',
      mappings = {
        ['<cr>'] = 'open',
        ['<esc>'] = 'revert_preview',
        ['<tab>'] = { 'toggle_preview', config = { use_float = true } },
        ['l'] = 'focus_preview',
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
        ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ['q'] = 'close_window',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
      },
    },
    filesystem = {
      window = {
        popup = {
          position = { col = '100%', row = '2' },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ':~')
            local root_len = string.len(root_name) + 4
            return {
              width = math.max(root_len, 50),
              height = vim.o.lines - 6,
            }
          end,
        },
        mappings = {
          ['H'] = 'toggle_hidden',
        },
      },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          --"node_modules"
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          '.DS_Store',
          'thumbs.db',
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  }

  require('neo-tree').setup(config)
end

return M
