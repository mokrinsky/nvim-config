local language, server, formatter, diagnostics, dap = unpack(require 'yumivim.plugins.lsp.dsl')

return language {
  name = 'lua',

  server.configured {
    name = 'lua_ls',

    config = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = { '?.lua', '?/init.lua' },
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              vim.fn.expand '$VIMRUNTIME/lua',
              vim.fn.stdpath 'config' .. '/lua',
              vim.fn.stdpath 'data' .. '/lazy',
              vim.fn.expand '$HOME/git/nvim-plugins/',
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
          completion = {
            callSnippet = 'Replace',
            workspaceWord = true,
            autoRequire = false,
          },
          misc = {
            parameters = {
              '--log-level=trace',
            },
          },
        },
      },
    },
  },

  formatter.null {
    runner = formatter.runner.stylua,
    config = {
      extra_args = {
        '--column-width',
        160,
        '--line-endings',
        'Unix',
        '--indent-type',
        'Spaces',
        '--indent-width',
        2,
        '--quote-style',
        'AutoPreferSingle',
        '--call-parentheses',
        'None',
      },
    },
  },

  diagnostics.null {
    runner = diagnostics.runner.selene,
    config = {
      extra_args = {
        '--config',
        vim.fn.expand '$HOME/.config/linters/selene.toml',
      },
    },
  },

  dap.disabled {},
}
