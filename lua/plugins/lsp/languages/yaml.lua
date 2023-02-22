local language, server, formatter, diagnostics = unpack(require 'plugins.lsp.dsl')

local json_schemas = require('schemastore').json.schemas {}
local yaml_schemas = {}
vim.tbl_map(function(schema)
  yaml_schemas[schema.url] = schema.fileMatch
end, json_schemas)

return language {
  name = 'yaml',

  server.configured {
    name = 'yamlls',
    config = {
      settings = {
        schemas = yaml_schemas,
        schemaStore = {
          enabled = true,
        },
      },
    },
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
        '{extends: default, rules:{document-start: disable, line-length: disable}}',
      },
    },
  },
}
