vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamed'
vim.opt.cmdheight = 1
vim.opt.colorcolumn = '80'
vim.opt.confirm = true
vim.opt.cul = false
vim.opt.expandtab = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 99
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = 'auto'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.mouse = ''

vim.g.mapleader = ' '
vim.g.did_load_filetypes = 1
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/usr/local/bin/python3.11'
vim.g.indent_guides_auto_colors = 0
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_color_change_percent = 3
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.ansible_attribute_highlight = 'ab'
vim.g.ansible_name_highlight = 'b'
vim.g.ansible_extra_keywords_highlight = 1
vim.g.ansible_extra_keywords_highlight_group = 'Statement'
vim.g.ansible_normal_keywords_highlight = 'Statement'
vim.g.ansible_loop_keywords_highlight = 'Statement'
vim.cmd [[let g:ansible_template_syntaxes = {"*.ya?ml.j2": "yaml"}]]

vim.cmd [[syntax on]]
