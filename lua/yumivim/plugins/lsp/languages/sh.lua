local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'shell',

  server.configured {
    name = 'bashls',
  },

  formatter.disabled {},

  diagnostics.disabled {},

  dap.disabled {},
}
