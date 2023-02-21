local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'ansible',

  server.configured {
    name = 'ansiblels',
  },

  formatter.disabled {},

  diagnostics.disabled {},
}
