local M = {}

function M.require(mod)
  return M.try(require, mod)
end

function M.try(fn, ...)
  local args = { ... }

  return xpcall(function()
    return fn(unpack(args))
  end, function(err)
    local lines = {}
    table.insert(lines, err)
    table.insert(lines, debug.traceback('', 3))

    M.error(table.concat(lines, '\n'))
    return err
  end)
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name or 'init.lua' })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name or 'init.lua' })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name or 'init.lua' })
end

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.abbrev(from, to, opts)
  -- This API is only available from nvim 0.7 and up.
  -- Setting abbreviations without it is tedious so we wont bother
  if not vim.api.nvim_create_user_command then
    return vim.api.notify_once 'Abbreviations are only available in nvim 0.7 and newer, please update.'
  end

  local options = { nargs = 0 }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_create_user_command(from, to, options)
end

function M.border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

return M
