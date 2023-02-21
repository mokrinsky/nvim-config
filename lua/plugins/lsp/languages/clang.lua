local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'clang',

  server.configured {
    name = 'clangd',
  },

  formatter.disabled {},

  diagnostics.disabled {},
}
