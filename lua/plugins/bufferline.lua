local M = {
  'noib3/nvim-cokeline',
  event = 'BufReadPre',
}

function M.config()
  local colors = require('catppuccin.palettes').get_palette()

  require('cokeline').setup {
    sidebar = {
      filetype = 'NvimTree',
      components = {
        {
          text = '  File Explorer',
          fg = function(buf)
            return buf.is_focused and colors.text or colors.surface2
          end,
          bg = 'NONE',
        },
      },
    },
    default_hl = {
      bg = 'NONE',
    },
    components = {
      {
        text = ' ',
      },
      {
        text = function(buf)
          return buf.is_focused and '' or ''
        end,
        fg = function(buf)
          return buf.devicon.color
        end,
      },
      {
        text = function(buf)
          return buf.devicon.icon
        end,
        fg = colors.surface0,
        bg = function(buf)
          return buf.is_focused and buf.devicon.color or 'NONE'
        end,
      },
      {
        text = function(buf)
          return buf.is_focused and '' or ''
        end,
        fg = function(buf)
          return buf.devicon.color
        end,
        bg = colors.surface0,
      },
      {
        text = function(buf)
          return ' ' .. buf.index .. ' ' .. buf.filename
        end,
        fg = function(buf)
          if buf.diagnostics.errors ~= 0 then
            return colors.red
          end
          if buf.diagnostics.warnings ~= 0 then
            return colors.yellow
          end
          if buf.diagnostics.hints ~= 0 then
            return colors.cyan
          end
          return buf.is_focused and colors.text or colors.surface2
        end,
        bg = function(buf)
          return buf.is_focused and colors.surface0 or 'NONE'
        end,
        style = function(buf)
          return buf.is_focused and 'bold' or nil
        end,
      },
      {
        text = function(buf)
          return buf.is_modified and ' ●' or ''
        end,
        fg = function(buf)
          return buf.is_focused and colors.yellow or colors.surface2
        end,
        bg = function(buf)
          return buf.is_focused and colors.surface0 or 'NONE'
        end,
      },
      {
        text = function(buf)
          return buf.is_focused and '' or ''
        end,
        fg = colors.surface0,
      },
    },
  }
end

return M
