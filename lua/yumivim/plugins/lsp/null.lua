local M = {}

function M.config(input_sources)
  local ns = require 'null-ls'
  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

  local extra_sources = {
    ns.builtins.code_actions.statix,
    ns.builtins.diagnostics.statix,
    ns.builtins.diagnostics.codespell,
  }
  for _, tool in pairs(extra_sources) do
    table.insert(input_sources, tool)
  end

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
