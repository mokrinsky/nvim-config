local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'git',

  server.disabled {},

  formatter.disabled {},

  diagnostics.null {
    runner = diagnostics.runner.commitlint,
    config = {
      extra_args = {},
      args = {},
    },
  },

  dap.disabled {},
}
