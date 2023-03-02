local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'ansible',

  server.configured {
    name = 'ansiblels',
  },

  formatter.disabled {},

  diagnostics.disabled {},

  dap.disabled {},
}
