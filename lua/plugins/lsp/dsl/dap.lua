local util = require 'plugins.lsp.dsl.util'

local __debugger = {
  configured = function(tbl)
    return {
      type = 'debugger',
      configure_with = 'dap',
      adapter = tbl.adapter or util.etable,
      config = tbl.config or util.etable,
    }
  end,
  disabled = function()
    return {
      type = 'disabled',
    }
  end,
}

local debugger = util.callable(__debugger, __debugger.configured)

return debugger
