local language, server, formatter, diagnostics, dap = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'go',

  server.configured {
    name = 'gopls',
  },

  formatter.null {
    runner = formatter.runner.gofmt,
  },

  diagnostics.disabled {},

  dap.configured {
    adapter = {
      name = 'delve',
      body = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
      },
    },
    config = {
      name = 'go',
      body = {
        {
          type = 'delve',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
      },
    },
  },
}
