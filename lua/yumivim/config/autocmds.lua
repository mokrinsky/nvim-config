local autocmd = vim.api.nvim_create_autocmd

-- Don't auto comment new lines
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Disable highlight searching for every buffer
vim.cmd [[autocmd BufEnter,WinEnter,FocusGained * set nohlsearch]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
autocmd('InsertEnter', {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

autocmd('InsertLeave', {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Highlight yanked text
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 100 }
  end,
})

-- Enable spellchecking in markdown, text and gitcommit files
autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown', 'text', 'tex' },
  callback = function()
    vim.opt_local.spell = true
  end,
})
