local language, server, formatter, diagnostics, dap = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'nix',

  server.configured {
    name = 'rnix',
  },

  formatter.null {
    runner = formatter.runner.alejandra,
  },

  diagnostics.disabled {},

  dap.disabled {},
}
