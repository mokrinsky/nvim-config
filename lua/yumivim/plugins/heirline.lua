local M = {
  'rebelot/heirline.nvim',
  event = 'UiEnter',
  dependencies = {
    'SmiteshP/nvim-navic',
    'lewis6991/gitsigns.nvim',
  },
}

function M.config()
  local line = require 'heirline'
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
    provider = function()
      return '▊'
    end,
    hl = { fg = colors.blue },
  }

  components.space = {
    provider = function()
      return ' '
    end,
    hl = { fg = 'NONE', bg = 'NONE' },
  }

  components.mode = {
    init = function(self)
      self.mode = vim.fn.mode(1)

      if not self.once then
        vim.api.nvim_create_autocmd('ModeChanged', {
          pattern = '*:*o',
          command = 'redrawstatus',
        })
        self.once = true
      end
    end,
    static = {
      mode_color = {
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
      },
    },
    provider = function(self)
      return self.mode
    end,
    hl = function(self)
      return { fg = '#313244', bg = self.mode_color[self.mode] }
    end,
    update = {
      'ModeChanged',
    },
  }

  components.location = {
    provider = function()
      return '%l:%2c'
    end,
    hl = { bg = colors.surface0, fg = colors.mauve },
    condition = conditions.buffer_not_empty,
  }

  components.ft = {
    provider = function()
      return vim.bo.filetype
    end,
    hl = function()
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
    static = {
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
      },
    },
    init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { 'DiagnosticChanged', 'BufEnter' },
    {
      provider = function(self)
        return self.errors > 0 and (self.icons.error .. self.errors .. ' ')
      end,
      hl = { fg = colors.red },
    },
    {
      provider = function(self)
        return self.warnings > 0 and (self.icons.warn .. self.warnings .. ' ')
      end,
      hl = { fg = colors.yellow },
    },
    {
      provider = function(self)
        return self.info > 0 and (self.icons.info .. self.info .. ' ')
      end,
      hl = { fg = colors.cyan },
    },
    hl = { bg = colors.surface0, fg = colors.surface0 },
  }

  components.navic = {
    condition = function()
      return require('nvim-navic').is_available()
    end,
    provider = function()
      require('nvim-navic').get_location { highlight = true }
    end,
    update = 'CursorMoved',
  }

  components.encoding = {
    provider = function()
      local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
      return enc ~= 'utf-8' and enc:upper()
    end,
    condition = conditions.hide_in_width,
    hl = { fg = colors.green, gui = 'bold' },
  }

  components.format = {
    provider = function()
      local fmt = vim.bo.fileformat
      return fmt ~= 'unix' and fmt:upper()
    end,
    hl = { fg = colors.green, gui = 'bold' },
  }

  components.branch = {
    condition = require('heirline.conditions').is_git_repo,
    init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
    end,
    provider = function(self)
      return '' .. self.status_dict.head
    end,
    hl = { bg = colors.lavender, fg = '#313244' },
  }

  components.git_diff = {
    init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
    end,
    static = {
      icons = { added = ' ', modified = '柳 ', removed = ' ' },
    },
    condition = conditions.hide_in_width and require('heirline.conditions').is_git_repo,
    {
      provider = function(self)
        local count = self.status_dict.added or 0
        return count > 0 and (self.icons.added .. count)
      end,
      hl = { fg = colors.green },
    },
    {
      provider = function(self)
        local count = self.status_dict.changed or 0
        return count > 0 and (self.icons.modified .. count)
      end,
      hl = { fg = colors.peach },
    },
    {
      provider = function(self)
        local count = self.status_dict.removed or 0
        return count > 0 and (self.icons.removed .. count)
      end,
      hl = { fg = colors.red },
    },
    hl = { bg = '#313244', fg = '#313244' },
  }

  components.rightpad = {
    provider = function()
      return '🮊'
    end,
    hl = { fg = colors.blue },
  }

  local statusline = {
    components.space,
    components.mode,
    components.location,
    components.space,
    components.ft,
    components.diag,
    { provider = '%=' },
    components.branch,
    components.git_diff,
    components.space,
  }

  local winbar = {
    components.navic,
  }

  line.setup {
    statusline = statusline,
    winbar = winbar,
  }
end

return M
