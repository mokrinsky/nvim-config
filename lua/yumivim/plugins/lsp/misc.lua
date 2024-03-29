local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

capabilities.offsetEncoding = 'utf-16'

local on_attach = function(client, bufnr)
  local wk = require 'which-key'
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  wk.register {
    ['gD'] = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', '' },
    ['gd'] = { '<Cmd>lua vim.lsp.buf.definition()<CR>', '' },
    ['K'] = { '<Cmd>lua vim.lsp.buf.hover()<CR>', '' },
    ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>', '' },
    ['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', '' },
    ['<space>wa'] = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', '' },
    ['<space>wr'] = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', '' },
    ['<space>wl'] = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', '' },
    ['<space>D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', '' },
    ['<space>rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', '' },
    ['gr'] = { '<cmd>lua vim.lsp.buf.references()<CR>', '' },
    ['<space>e'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', '' },
    ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', '' },
    [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', '' },
    ['<space>q'] = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', '' },
  }

  -- I like treesitter colors for now i think
  client.server_capabilities.semanticTokensProvider = nil

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

return { capabilities, on_attach }
