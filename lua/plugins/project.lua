local M = {
  'ahmedkhalf/project.nvim',
  lazy = false,
}

function M.config()
  require('project_nvim').setup {}
end

return M
