local M = {
  'folke/noice.nvim',
  dependencies = {
    {
      'rcarriga/nvim-notify',
      opts = {
        background_colour = require('catppuccin.palettes').get_palette('mocha').base,
      },
    },
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
}

M.enabled = true

function M.config()
  local noice = require 'noice'
  local wk = require 'which-key'
  local focused = true
  vim.api.nvim_create_autocmd('FocusGained', {
    callback = function()
      focused = true
    end,
  })
  vim.api.nvim_create_autocmd('FocusLost', {
    callback = function()
      focused = false
    end,
  })
  noice.setup {
    debug = false,
    views = {
      mini = {
        win_options = {
          winblend = 0,
          winhighlight = {
            Normal = 'NoiceMini',
            IncSearch = '',
            Search = '',
          },
        },
      },
    },
    lsp = {
      signature = {
        enabled = false,
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    routes = {
      {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = 'notify_send',
        opts = { stop = false },
      },
      {
        filter = {
          event = 'msg_show',
          find = '%d+L, %d+B',
        },
        view = 'mini',
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      cmdline_output_to_split = false,
    },
    commands = {
      all = {
        -- options for the message history that you get with `:Noice`
        view = 'split',
        opts = { enter = true, format = 'details' },
        filter = {},
      },
    },
  }

  wk.register({
    ['<S-Enter'] = {
      function()
        noice.redirect(vim.fn.getcmdline())
      end,
      'Redirect Cmdline',
    },
  }, { mode = { 'c' } })

  wk.register({
    ['<leader>nl'] = {
      function()
        noice.cmd 'last'
      end,
      'Noice Last Message',
    },
    ['<leader>nh'] = {
      function()
        noice.cmd 'history'
      end,
      'Noice History',
    },
    ['<leader>na'] = {
      function()
        noice.cmd 'all'
      end,
      'Noice All',
    },
  }, { mode = { 'n' } })

  vim.keymap.set('n', '<c-f>', function()
    if not require('noice.lsp').scroll(4) then
      return '<c-f>'
    end
  end, { silent = true, expr = true })

  vim.keymap.set('n', '<c-b>', function()
    if not require('noice.lsp').scroll(-4) then
      return '<c-b>'
    end
  end, { silent = true, expr = true })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function(event)
      vim.schedule(function()
        require('noice.text.markdown').keys(event.buf)
      end)
    end,
  })
end

return M
