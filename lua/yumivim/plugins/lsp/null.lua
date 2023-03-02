local M = {}

function M.config(input_sources)
  local ns = require 'null-ls'
  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

  ns.setup {
    border = 'rounded',
    sources = {
      unpack(input_sources),
    },
    on_attach = function(client, bufnr)
      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format {
              timeout_ms = 10000,
              bufnr = bufnr,
              filter = function(clnt)
                return clnt.name == 'null-ls'
              end,
            }
          end,
        })
      end
    end,
  }
end

return M
