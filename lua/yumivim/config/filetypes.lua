vim.filetype.add {
  filename = {
    ['ssh_config'] = 'sshconfig',
  },
  pattern = {
    ['.*git/config'] = 'gitconfig',
    ['${HOME}/.ssh/config.*'] = 'sshconfig',
    ['.*/.kube/config'] = 'yaml',
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
    json = function()
      vim.opt_local.conceallevel = 0
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      return 'json'
    end,
    xml = function()
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
      return 'xml'
    end,
  },
}
