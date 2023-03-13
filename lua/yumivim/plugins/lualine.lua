local M = {
  'nvim-lualine/lualine.nvim',
  -- event = 'VeryLazy',
  dependencies = {
    {
      'SmiteshP/nvim-navic',
      opts = {
        highlight = true,
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = 'ﴯ ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = 'ℰ',
          Interface = 'ﰮ ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = '⊨ ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = 'NULL',
          EnumMember = ' ',
          Struct = 'פּ ',
          Event = '',
          Operator = ' ',
          TypeParameter = ' ',
        },
      },
    },
  },
}

function M.config()
  local lualine = require 'lualine'
  local get_mode = require('lualine.utils.mode').get_mode
  local colors = require('catppuccin.palettes').get_palette()

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
  }

  local components = {}

  components.leftpad = {
    function()
      return '▊'
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  components.space = {
    function()
      return ' '
    end,
    color = { bg = 'NONE', fg = 'NONE' },
  }

  components.mode = {
    function()
      return get_mode()
    end,
    color = function()
      local mode_color = {
        n = colors.red,
        no = colors.red,
        i = colors.green,
        ic = colors.yellow,
        t = colors.red,
        v = colors.blue,
        V = colors.blue,
        ['\22'] = colors.blue,
        R = colors.lavender,
        Rv = colors.lavender,
        s = colors.peach,
        S = colors.peach,
        ['\19'] = colors.peach,
        c = colors.mauve,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
      }
      return { bg = mode_color[vim.fn.mode()], fg = '#313244' }
    end,
    separator = { left = '', right = '' },
  }

  components.location = {
    'location',
    cond = conditions.buffer_not_empty,
    color = { bg = colors.surface0, fg = colors.mauve },
    separator = { left = '', right = '' },
  }

  components.ft = {
    function()
      return vim.bo.filetype
    end,
    color = function()
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return { bg = colors.surface0, fg = colors.text }
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return { bg = colors.peach, fg = colors.surface0 }
        end
      end
      return { bg = colors.surface0, fg = colors.text }
    end,
    separator = { left = '', right = '' },
  }

  components.diag = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
    separator = { left = '', right = '' },
    color = { bg = colors.surface0, fg = colors.surface0 },
  }

  components.navic = {
    require('nvim-navic').get_location,
    cond = require('nvim-navic').is_available,
  }

  components.encoding = {
    'o:encoding',
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
  }

  components.format = {
    'fileformat',
    icons_enabled = false,
    color = { fg = colors.green, gui = 'bold' },
  }

  components.branch = {
    'branch',
    icon = '',
    color = { bg = colors.lavender, fg = '#313244' },
    separator = { left = '', right = '' },
  }

  components.git_diff = {
    'diff',
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.peach },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
    color = { bg = '#313244', fg = '#313244' },
    separator = { left = '', right = '' },
  }

  components.rightpad = {
    function()
      return '🮊'
    end,
    color = { fg = colors.blue },
    padding = { right = 0, left = 1 },
  }

  local config = {
    options = {
      component_separators = '',
      section_separators = '',
      globalstatus = true,
      ignore_focus = {
        'NvimTree',
        'neo-tree',
        'Outline',
        'toggleterm',
        'alpha',
        'dapui_watches',
        'dapui_stacks',
        'dapui_breakpoints',
        'dapui_scopes',
        'dapui_console',
        'dap-repl',
      },
      theme = 'catppuccin',
    },
    sections = {
      lualine_a = {
        components.space,
        components.mode,
        components.location,
      },
      lualine_b = {
        components.space,
      },
      lualine_c = {
        components.ft,
        components.diag,
      },
      lualine_x = {
        components.branch,
        components.git_diff,
        components.space,
      },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        components.leftpad,
        components.encoding,
        components.format,
        components.rightpad,
      },
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = {
        components.navic,
      },
    },
  }

  lualine.setup(config)
end

return M
