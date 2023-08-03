-- Copyright 2023 Folke https://github.com/folke
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- From github.com/mokrinsky:
-- Original of this file belongs to Folke and is licensed under Apache 2.0
-- I used this file and adapted it to my needs willing to do the same as Folke
-- did in the way his LazyVim is installed.

local M = {}

local defaults = {
  colorscheme = 'catppuccin',
  defaults = {
    autocmds = true,
    mappings = true,
    options = true,
    filetypes = true,
  },
  lsp_config = {
    mode = 'symbol_text',
    max_width = 20,
    symbol_map = {
      Array = '󰅪',
      Boolean = '⊨',
      Class = '󰠱',
      Color = '',
      Constant = '',
      Constructor = '',
      Enum = '',
      EnumMember = '',
      Event = '',
      Field = '󰆨',
      File = '',
      Folder = '',
      Function = '󰊕',
      Interface = '󰜰',
      Key = '󰌋',
      Keyword = '󰌋',
      Method = '',
      Module = '󰆧',
      Namespace = '󰅪',
      NONE = '',
      Null = 'NULL',
      Number = '󰎠',
      Object = '󰅩',
      Operator = '󰆕',
      Package = '󰏗',
      Property = '',
      Reference = '',
      Snippet = '',
      String = '󰀬',
      Struct = '󰙅',
      Text = '󰉿',
      TypeParameter = '',
      Unit = '',
      Value = '',
      Variable = '󰀫',
    },
    menu = {
      nvim_lsp = '[LSP]',
      emoji = '[Emoji]',
      path = '[Path]',
      calc = '[Calc]',
      cmp_tabnine = '[Tabnine]',
      vsnip = '[Snippet]',
      luasnip = '[Snippet]',
      buffer = '[Buffer]',
      tmux = '[TMUX]',
      copilot = '[Copilot]',
      treesitter = '[TreeSitter]',
      nvim_lua = '[Lua]',
      orgmode = '[Orgmode]',
    },
  },
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend('force', defaults, opts or {})

  M.load 'autocmds'
  M.load 'mappings'
  M.load 'filetypes'

  require('lazy.core.util').try(function()
    if type(M.colorscheme) == 'function' then
      M.colorscheme()
    else
      vim.cmd.colorscheme(M.colorscheme)
    end
  end, {
    msg = 'Could not load your colorscheme',
    on_error = function(msg)
      require('lazy.core.util').error(msg)
      vim.cmd.colorscheme 'habamax'
    end,
  })
end

function M.load(name)
  local Util = require 'lazy.core.util'
  local function _load(mod)
    Util.try(function()
      require(mod)
    end, {
      msg = 'Failed loading ' .. mod,
      on_error = function(msg)
        local modpath = require('lazy.core.cache').find(mod)
        if modpath then
          Util.error(msg)
        end
      end,
    })
  end
  if M.defaults[name] then
    _load('yumivim.config.' .. name)
  end
  _load('config.' .. name)
  if vim.bo.filetype == 'lazy' then
    vim.cmd [[do VimResized]]
  end
end

M.did_init = false

function M.init()
  if not M.did_init then
    M.did_init = true
    M.lazy_notify()
    require('yumivim.config').load 'options'
  end
end

function M.lazy_notify()
  local notifs = {}
  local function temp(...)
    table.insert(notifs, vim.F.pack_len(...))
  end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.loop.new_timer()
  local check = vim.loop.new_check()

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig -- put back the original notify if needed
    end
    vim.schedule(function()
      ---@diagnostic disable-next-line: no-unknown
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  -- wait till vim.notify has been replaced
  check:start(function()
    if vim.notify ~= temp then
      replay()
    end
  end)
  -- or if it took more than 500ms, then something went wrong
  timer:start(500, 0, replay)
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end
    return options[key]
  end,
})

return M
