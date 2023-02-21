local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
}

function M.config()
  local theme = require 'catppuccin'
  theme.setup {
    flavour = 'mocha', -- Can be one of: latte, frappe, macchiato, mocha
    background = { light = 'latte', dark = 'mocha' },
    dim_inactive = {
      enabled = false,
      -- Dim inactive splits/windows/buffers.
      -- NOT recommended if you use old palette (a.k.a., mocha).
      shade = 'dark',
      percentage = 0.15,
    },
    transparent_background = true,
    term_colors = true,
    compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
    styles = {
      comments = { 'italic' },
      properties = { 'italic' },
      functions = { 'italic', 'bold' },
      keywords = { 'italic' },
      operators = { 'bold' },
      conditionals = { 'bold' },
      loops = { 'bold' },
      booleans = { 'bold', 'italic' },
      numbers = {},
      types = {},
      strings = {},
      variables = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
      gitsigns = true,
      telescope = true,
      nvimtree = true,
      indent_blankline = { enabled = true, colored_indent_levels = true },
      dashboard = true,
      mason = true,
      cmp = true,
      dap = { enabled = true, enable_ui = true },
      symbols_outline = true,
      neotree = true,
      noice = true,
      notify = true,
      which_key = true,
      illuminate = true,
      navic = { enabled = true },
    },
    highlight_overrides = {
      mocha = function(cp)
        return {
          FocusedSymbol = { fg = cp.base, bg = cp.mauve },
          NoiceMini = { bg = 'NONE' },
          -- For base configs.
          CursorLineNr = { fg = cp.green },
          Search = { bg = cp.surface1, fg = cp.pink, style = { 'bold' } },
          IncSearch = { bg = cp.pink, fg = cp.surface1 },

          -- For native lsp configs.
          DiagnosticVirtualTextError = { bg = cp.none },
          DiagnosticVirtualTextWarn = { bg = cp.none },
          DiagnosticVirtualTextInfo = { bg = cp.none },
          DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

          DiagnosticHint = { fg = cp.rosewater },
          LspDiagnosticsDefaultHint = { fg = cp.rosewater },
          LspDiagnosticsHint = { fg = cp.rosewater },
          LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
          LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

          -- For fidget.
          FidgetTask = { bg = cp.none, fg = cp.surface2 },
          FidgetTitle = { fg = cp.blue, style = { 'bold' } },

          -- For treesitter.
          ['@field'] = { fg = cp.rosewater },
          ['@property'] = { fg = cp.yellow },

          ['@include'] = { fg = cp.teal },
          ['@operator'] = { fg = cp.sky },
          ['@keyword.operator'] = { fg = cp.sky },
          ['@punctuation.special'] = { fg = cp.maroon },

          -- ["@float"] = { fg = cp.peach },
          -- ["@number"] = { fg = cp.peach },
          -- ["@boolean"] = { fg = cp.peach },

          ['@constructor'] = { fg = cp.lavender },
          -- ["@constant"] = { fg = cp.peach },
          -- ["@conditional"] = { fg = cp.mauve },
          -- ["@repeat"] = { fg = cp.mauve },
          ['@exception'] = { fg = cp.peach },

          ['@constant.builtin'] = { fg = cp.lavender },
          -- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
          -- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
          ['@variable.builtin'] = { fg = cp.red, style = { 'italic' } },

          -- ["@function"] = { fg = cp.blue },
          ['@function.macro'] = { fg = cp.red, style = {} },
          ['@parameter'] = { fg = cp.rosewater },
          ['@keyword.function'] = { fg = cp.maroon },
          ['@keyword'] = { fg = cp.red },
          ['@keyword.return'] = { fg = cp.pink, style = {} },

          -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
          -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
          -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
          -- ["@constant.macro"] = { fg = cp.mauve },

          -- ["@label"] = { fg = cp.blue },
          ['@method'] = { style = { 'italic' } },
          ['@namespace'] = { fg = cp.rosewater, style = {} },

          ['@punctuation.delimiter'] = { fg = cp.teal },
          ['@punctuation.bracket'] = { fg = cp.overlay2 },
          -- ["@string"] = { fg = cp.green },
          -- ["@string.regex"] = { fg = cp.peach },
          -- ["@type"] = { fg = cp.yellow },
          ['@variable'] = { fg = cp.text },
          ['@tag.attribute'] = { fg = cp.mauve, style = { 'italic' } },
          ['@tag'] = { fg = cp.peach },
          ['@tag.delimiter'] = { fg = cp.maroon },
          ['@text'] = { fg = cp.text },

          -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
          -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
          -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
          -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
          -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
          -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
          -- ["@string.escape"] = { fg = cp.pink },

          -- ["@property.toml"] = { fg = cp.blue },
          -- ["@field.yaml"] = { fg = cp.blue },

          -- ["@label.json"] = { fg = cp.blue },

          ['@function.builtin.bash'] = { fg = cp.red, style = { 'italic' } },
          ['@parameter.bash'] = { fg = cp.yellow, style = { 'italic' } },

          ['@field.lua'] = { fg = cp.lavender },
          ['@constructor.lua'] = { fg = cp.flamingo },

          ['@constant.java'] = { fg = cp.teal },

          ['@property.typescript'] = { fg = cp.lavender, style = { 'italic' } },
          -- ["@constructor.typescript"] = { fg = cp.lavender },

          -- ["@constructor.tsx"] = { fg = cp.lavender },
          -- ["@tag.attribute.tsx"] = { fg = cp.mauve },

          ['@type.css'] = { fg = cp.lavender },
          ['@property.css'] = { fg = cp.yellow, style = { 'italic' } },

          ['@property.cpp'] = { fg = cp.text },

          -- ["@symbol"] = { fg = cp.flamingo },

          CmpItemAbbrDeprecated = { fg = '#7E8294', bg = cp.none, style = { 'strikethrough' } },
          CmpItemAbbrMatch = { fg = '#82AAFF', bg = cp.none, style = { 'bold' } },
          CmpItemAbbrMatchFuzzy = { fg = '#82AAFF', bg = cp.none, style = { 'bold' } },
          CmpItemMenu = { fg = cp.lavender, bg = cp.none, style = { 'italic' } },

          CmpItemKindField = { fg = cp.base, bg = cp.red },
          CmpItemKindProperty = { fg = cp.base, bg = cp.red },
          CmpItemKindEvent = { fg = cp.base, bg = cp.red },

          CmpItemKindText = { fg = cp.base, bg = cp.green },
          CmpItemKindEnum = { fg = cp.base, bg = cp.green },
          CmpItemKindKeyword = { fg = cp.base, bg = cp.green },

          CmpItemKindConstant = { fg = '#FFE082', bg = cp.yellow },
          CmpItemKindConstructor = { fg = '#FFE082', bg = cp.yellow },
          CmpItemKindReference = { fg = '#FFE082', bg = cp.yellow },

          CmpItemKindFunction = { fg = cp.base, bg = cp.lavender },
          CmpItemKindStruct = { fg = cp.base, bg = cp.lavender },
          CmpItemKindClass = { fg = cp.base, bg = cp.lavender },
          CmpItemKindModule = { fg = cp.base, bg = cp.lavender },
          CmpItemKindOperator = { fg = cp.base, bg = cp.lavender },

          CmpItemKindVariable = { fg = '#C5CDD9', bg = '#7E8294' },
          CmpItemKindFile = { fg = '#C5CDD9', bg = '#7E8294' },

          CmpItemKindUnit = { fg = '#F5EBD9', bg = '#D4A959' },
          CmpItemKindSnippet = { fg = '#F5EBD9', bg = '#D4A959' },
          CmpItemKindFolder = { fg = '#F5EBD9', bg = '#D4A959' },

          CmpItemKindMethod = { fg = '#DDE5F5', bg = '#6C8ED4' },
          CmpItemKindValue = { fg = '#DDE5F5', bg = '#6C8ED4' },
          CmpItemKindEnumMember = { fg = '#DDE5F5', bg = '#6C8ED4' },

          CmpItemKindInterface = { fg = '#D8EEEB', bg = '#58B5A8' },
          CmpItemKindColor = { fg = '#D8EEEB', bg = '#58B5A8' },
          CmpItemKindTypeParameter = { fg = '#D8EEEB', bg = '#58B5A8' },
        }
      end,
    },
  }

  vim.cmd.colorscheme 'catppuccin'
end

return M
