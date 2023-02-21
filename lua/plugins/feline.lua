local M = {
  'feline-nvim/feline.nvim',
}

function M.config()
  local feline = require 'feline'
  local component = {}

  local colors = require('catppuccin.palettes').get_palette()
  colors.fg = colors.text
  colors.bg = 'NONE'

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
  }

  component.leftbar = {
    provider = function()
      return '▊'
    end,
    hl = function()
      return {
        fg = colors.blue,
      }
    end,
  }

  component.rightbar = {
    provider = function()
      return '🮊'
    end,
    hl = function()
      return {
        fg = colors.blue,
      }
    end,
  }

  component.mode = {
    provider = {
      name = 'vi_mode',
      opts = {
        show_mode_name = true,
      },
    },
    icon = '',
    hl = function()
      return {
        fg = require('feline.providers.vi_mode').get_mode_color(),
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
  }

  component.filename = {
    provider = {
      name = 'file_info',
      opts = {
        type = 'base-only',
        file_modified_icon = '',
      },
    },
    icon = '',
    hl = function()
      return {
        fg = colors.mauve,
        style = 'bold',
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
    enabled = conditions.buffer_not_empty,
  }

  component.position = {
    provider = 'position',
    left_sep = ' ',
    right_sep = ' ',
  }

  component.ft = {
    provider = function()
      return vim.bo.filetype
    end,
    icon = function()
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ''
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return '󰥙 '
        end
      end
      return ''
    end,
    hl = function()
      return {
        fg = colors.peach,
        style = 'bold',
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
  }

  component.diagnostic_errors = {
    provider = 'diagnostic_errors',
    hl = {
      fg = colors.red,
    },
  }

  component.diagnostic_warnings = {
    provider = 'diagnostic_warnings',
    hl = {
      fg = colors.yellow,
    },
  }

  component.diagnostic_hints = {
    provider = 'diagnostic_hints',
    hl = {
      fg = colors.cyan,
    },
  }

  component.diagnostic_info = {
    provider = 'diagnostic_info',
  }

  component.navic = {
    provider = function()
      return require('nvim-navic').get_location()
    end,
    enabled = function()
      return require('nvim-navic').is_available()
    end,
    left_sep = ' ',
    right_sep = ' ',
  }

  component.encoding = {
    provider = 'file_encoding',
    hl = function()
      return {
        fg = colors.green,
        style = 'bold',
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
    enabled = conditions.hide_in_width,
  }

  component.format = {
    provider = 'file_format',
    hl = function()
      return {
        fg = colors.green,
        style = 'bold',
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
  }

  component.git_branch = {
    provider = 'git_branch',
    hl = function()
      return {
        fg = colors.lavender,
        style = 'bold',
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
  }

  component.git_diff_added = {
    provider = 'git_diff_added',
    left_sep = ' ',
    right_sep = ' ',
    icon = ' ',
    hl = function()
      return {
        fg = colors.green,
      }
    end,
    enabled = conditions.hide_in_width,
  }

  component.git_diff_removed = {
    provider = 'git_diff_removed',
    right_sep = ' ',
    icon = ' ',
    hl = function()
      return {
        fg = colors.red,
      }
    end,
    enabled = conditions.hide_in_width,
  }

  component.git_diff_changed = {
    provider = 'git_diff_changed',
    right_sep = ' ',
    icon = '柳 ',
    hl = function()
      return {
        fg = colors.peach,
      }
    end,
    enabled = conditions.hide_in_width,
  }

  local left = {
    component.leftbar,
    component.mode,
    component.filename,
    component.position,
    component.ft,
    component.diagnostic_errors,
    component.diagnostic_warnings,
    component.diagnostic_hints,
    component.diagnostic_info,
    component.navic,
  }
  local middle = {}
  local right = {
    component.encoding,
    component.format,
    component.git_branch,
    component.git_diff_added,
    component.git_diff_changed,
    component.git_diff_removed,
    component.rightbar,
  }

  local components = {
    active = {
      left,
      middle,
      right,
    },
  }

  feline.setup {
    components = components,
    theme = colors,
    mode_colors = {
      n = { 'NORMAL', colors.red },
      no = { 'N-PENDING', colors.red },
      i = { 'INSERT', colors.green },
      ic = { 'INSERT', colors.yellow },
      t = { 'TERMINAL', colors.red },
      v = { 'VISUAL', colors.blue },
      V = { 'V-LINE', colors.blue },
      ['�'] = { 'V-BLOCK', colors.blue },
      R = { 'REPLACE', colors.lavender },
      Rv = { 'V-REPLACE', colors.lavender },
      s = { 'SELECT', colors.peach },
      S = { 'S-LINE', colors.peach },
      ['�'] = { 'S-BLOCK', colors.peach },
      c = { 'COMMAND', colors.mauve },
      cv = { 'COMMAND', colors.red },
      ce = { 'COMMAND', colors.red },
      r = { 'PROMPT', colors.cyan },
      rm = { 'MORE', colors.cyan },
      ['r?'] = { 'CONFIRM', colors.cyan },
      ['!'] = { 'SHELL', colors.red },
    },
    force_inactive = {
      filetypes = {
        '^NvimTree$',
        '^packer$',
        '^startify$',
        '^fugitive$',
        '^fugitiveblame$',
        '^qf$',
        '^help$',
        '^lspsagaoutline$',
        '^Outline$',
      },
      buftypes = {
        '^terminal$',
      },
    },
  }
end

return M
