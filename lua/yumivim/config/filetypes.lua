vim.filetype.add {
  filename = {
    ['ssh_config'] = 'sshconfig',
  },
  pattern = {
    ['.*git/config'] = 'gitconfig',
    ['${HOME}/.ssh/config.*'] = 'sshconfig',
    ['.*/.kube/config'] = 'yaml',
    ['.*/.github/workflows/.*'] = 'yaml',
  },
  extension = {
    service = function()
      return 'systemd'
    end,
  },
}
