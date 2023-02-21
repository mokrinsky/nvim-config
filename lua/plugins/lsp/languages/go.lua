local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'go',

  server.configured {
    name = 'gopls',
  },

  formatter.null {
    runner = formatter.runner.gofmt,
  },

  diagnostics.disabled {},
}
