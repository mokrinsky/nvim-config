local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'shell',

  server.disabled {},

  formatter.disabled {},

  diagnostics.null {
    runner = diagnostics.runner.shellcheck,
  },

  dap.disabled {},
}
