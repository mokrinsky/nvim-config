local M = {
  'nathom/filetype.nvim',
  lazy = false,
}

function M.config()
  require('filetype').setup {
    overrides = {
      extensions = {
        -- Set the filetype of *.pn files to potion
        pn = 'potion',
      },
      literal = {
        -- Set the filetype of files named "MyBackupFile" to lua
        MyBackupFile = 'lua',
      },
      complex = {
        -- Set the filetype of any full filename matching the regex to gitconfig
        ['.*git/config'] = 'gitconfig', -- Included in the plugin
        ['ssh_config'] = 'sshconfig',
        ['.*ssh/config.*'] = 'sshconfig',
      },

      -- The same as the ones above except the keys map to functions
      function_extensions = {
        ['service'] = function()
          vim.bo.filetype = 'systemd'
        end,
        ['lua'] = function()
          vim.bo.filetype = 'lua'
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end,
        ['nix'] = function()
          vim.bo.filetype = 'nix'
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end,
        ['yaml'] = function()
          vim.bo.filetype = 'yaml'
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end,
        ['cpp'] = function()
          vim.bo.filetype = 'cpp'
          vim.opt_local.foldlevel = 0
          vim.opt_local.foldnestmax = 1
          -- Remove annoying indent jumping
          vim.bo.cinoptions = vim.bo.cinoptions .. 'L0'
        end,
        ['go'] = function()
          vim.bo.filetype = 'go'
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.softtabstop = 0
          vim.opt_local.expandtab = false
        end,
        ['pdf'] = function()
          vim.bo.filetype = 'pdf'
          -- Open in PDF viewer (Skim.app) automatically
          vim.fn.jobstart('open -a skim ' .. '"' .. vim.fn.expand '%' .. '"')
        end,
      },
      function_literal = {
        Brewfile = function()
          vim.cmd 'syntax off'
        end,
      },
      function_complex = {
        ['*.math_notes/%w+'] = function()
          vim.cmd 'iabbrev $ $$'
        end,
      },

      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = 'sh',
      },
    },
  }
end

return M
