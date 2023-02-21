local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

return language {
  name = 'yaml',

  server.configured {
    name = 'yamlls',
  },

  formatter.null {
    runner = formatter.runner.yamlfmt,
    config = {
      disabled_filetypes = { 'yaml.ansible' },
    },
  },

  diagnostics.null {
    runner = diagnostics.runner.yamllint,
    config = {
      disabled_filetypes = { 'yaml.ansible' },
      extra_args = {
        '-d',
        '{extends: default, rules:{document-start: disable}}',
      },
    },
  },
}
