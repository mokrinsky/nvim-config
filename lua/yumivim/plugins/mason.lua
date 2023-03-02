local M = { 'williamboman/mason.nvim' }

function M.config()
  require('mason').setup {
    ui = {
      border = 'rounded',
      icons = {
        package_installed = ' ',
        package_pending = ' ',
        package_uninstalled = ' ﮊ',
      },
    },
  }
  require('mason-lspconfig').setup {
    automatic_installation = true,
    ensure_installed = {
      'ansiblels',
      'terraformls',
      'lua_ls',
      'clangd',
      'gopls',
      'dockerls',
      'yamlls',
      'tsserver',
    },
  }
  require('mason-tool-installer').setup {
    run_on_start = true,
    ensure_installed = {
      'selene',
      'stylua',
      'yamlfmt',
      'yamllint',
    },
  }
end

return M
