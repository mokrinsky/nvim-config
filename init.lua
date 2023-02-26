local util = require 'utils'

util.require 'core.options'
util.require 'core.lazy'
util.require 'core.filetype'

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    util.require 'core.autocmds'
    util.require 'core.mappings'
  end,
})
