local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'python',

  server.configured {
    name = 'pyright',
  },

  formatter.null {
    runner = formatter.runner.black,
  },

  diagnostics.null {
    runner = diagnostics.runner.pylint,
  },

  dap.disabled {},
}
