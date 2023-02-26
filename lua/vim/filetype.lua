require 'os'

vim.filetype.add {
  filename = {
    [os.getenv 'HOME' .. '/.kube/config'] = 'yaml',
    ['ssh_config'] = 'sshconfig',
  },
  pattern = {
    ['.*git/config'] = 'gitconfig',
    [os.getenv 'HOME' .. '/.ssh/config.*'] = 'sshconfig',
  },
  extension = {
    service = function()
      return 'systemd'
    end,
    lua = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      return 'lua'
    end,
    nix = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      return 'nix'
    end,
    yaml = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      return 'yaml'
    end,
    go = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 0
      vim.opt_local.expandtab = false
      return 'go'
    end,
  },
}
