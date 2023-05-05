local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'typescript',

  server.configured {
    name = 'tsserver',
  },

  formatter.null {
    runner = formatter.runner.prettier,
  },

  diagnostics.disabled {},

  dap.disabled {},
}
