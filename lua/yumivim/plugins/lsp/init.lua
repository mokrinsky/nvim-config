local M = {
  'neovim/nvim-lspconfig',
  name = 'lsp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
}

function M.config()
  -- init neodev before any other lsp-related shit
  -- require('neodev').setup {
  --   debug = true,
  --   experimental = {
  --     pathStrict = true,
  --   },
  -- }

  require('yumivim.plugins.lsp.diagnostics').setup()
  require('lsp_signature').setup { check_completion_visible = true }
  require('lspconfig.ui.windows').default_options = { border = 'rounded' }

  local lsp_config = require 'lspconfig'
  local dap = require 'dap'
  local capabilities, on_attach = unpack(require 'yumivim.plugins.lsp.misc')
  local format_config = {}
  local languages = require 'yumivim.plugins.lsp.languages.__collect'

  for _, module in pairs(languages) do
    if module.enabled then
      for _, server in pairs(module.servers) do
        if server.pre then
          server.pre()
        end

        if server.configure_with == 'lspconfig' then
          local config = server.overrides or {}

          config.autostart = true
          config.capabilities = capabilities
          config.on_attach = on_attach

          lsp_config[server.declared_config.name].setup(config)
        elseif server.configure_with == 'external' then
          server.setup(module)
        end

        if server.post then
          server.post()
        end
      end

      for _, debugger in pairs(module.debuggers) do
        if debugger.configure_with == 'dap' then
          dap.adapters[debugger.adapter.name] = debugger.adapter.body
          dap.configurations[debugger.config.name] = debugger.config.body
        end
      end

      for _, formatter in pairs(module.formatters) do
        if formatter.configure_with == 'null-ls' then
          table.insert(format_config, formatter.source)
        elseif formatter.configure_with == 'lsp' then
          vim.pretty_print(formatter, 'lsp fmt')
        end
      end

      for _, diag in pairs(module.diagnostics) do
        if diag.configure_with == 'null-ls' then
          table.insert(format_config, diag.source)
        elseif diag.configure_with == 'lsp' then
          vim.pretty_print(diag, 'lsp fmt')
        end
      end
    else
      print(('[lang] %s disabled'):format(module.name))
    end
  end

  require('yumivim.plugins.lsp.null').config(format_config)
  -- local servers = { 'clangd', 'ansiblels', 'terraformls', 'gopls', 'tsserver', 'dockerls', 'yamlls', 'rnix' }
end

return M
