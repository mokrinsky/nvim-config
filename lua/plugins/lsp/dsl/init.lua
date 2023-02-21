local language = require 'plugins.lsp.dsl.language'
local server = require 'plugins.lsp.dsl.server'
local formatter = require 'plugins.lsp.dsl.format'
local diagnostics = require 'plugins.lsp.dsl.diag'

return { language, server, formatter, diagnostics }
