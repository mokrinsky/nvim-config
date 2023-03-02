local util = require 'yumivim.plugins.lsp.dsl.util'

local __diagnostics = {
  null = function(tbl)
    return {
      type = 'diagnostics',
      configure_with = 'null-ls',
      source = tbl.config and tbl.runner.with(tbl.config) or tbl.runner,
    }
  end,
  disabled = function()
    return {
      type = 'disabled',
    }
  end,
  lsp = function(tbl)
    return {
      type = 'diagnostics',
      configure_with = 'lsp',
      declared_config = tbl,
      overrides = tbl.config,
    }
  end,
  runner = require('null-ls').builtins.diagnostics,
}

local diagnostics = util.callable(__diagnostics, __diagnostics.null)

return diagnostics
