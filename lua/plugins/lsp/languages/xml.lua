local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'xml',

  server.disabled {},

  formatter.null {
    runner = formatter.runner.xmllint,
    config = {
      env = {
        XMLLINT_INDENT = '    ',
      },
    },
  },

  diagnostics.disabled {},
}
