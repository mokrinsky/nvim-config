local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'nix',

  server.configured {
    name = 'rnix',
  },

  formatter.null {
    runner = formatter.runner.alejandra,
  },

  diagnostics.null {
    runner = diagnostics.runner.deadnix,
  },

  dap.disabled {},
}
