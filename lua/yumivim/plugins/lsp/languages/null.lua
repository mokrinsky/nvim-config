local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'null',

  server.external {
    setup = function()
      local ns = require 'null-ls'
      ns.setup {
        sources = {
          -- diagnostics
          ns.builtins.diagnostics.statix,
          ns.builtins.diagnostics.codespell,
          -- code_actions
          ns.builtins.code_actions.statix,
        },
      }
    end,
  },

  formatter.disabled {},

  diagnostics.disabled {},

  dap.disabled {},
}
