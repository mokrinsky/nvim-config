local o = vim.opt
local g = vim.g

o.background = 'dark'
o.backspace = 'indent,eol,start'
o.clipboard = 'unnamed'
o.cmdheight = 1
o.colorcolumn = '120'
o.conceallevel = 3
o.confirm = true
o.cul = false
o.cursorline = true
o.expandtab = true
o.fillchars = { eob = ' ' }
o.foldlevel = 99
o.foldmethod = 'indent'
o.foldnestmax = 99
o.ignorecase = true
o.laststatus = 2
o.number = true
o.numberwidth = 2
o.shiftwidth = 4
o.showmode = false
o.signcolumn = 'auto'
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.softtabstop = 0
o.splitbelow = true
o.splitright = true
o.tabstop = 8
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.mouse = ''

g.mapleader = ' '
g.markdown_recommended_style = 0
g.indent_guides_auto_colors = 0
g.indent_guides_start_level = 2
g.indent_guides_guide_size = 1
g.indent_guides_color_change_percent = 3
g.indent_guides_enable_on_vim_startup = 1
g.ansible_attribute_highlight = 'ab'
g.ansible_name_highlight = 'b'
g.ansible_extra_keywords_highlight = 1
g.ansible_extra_keywords_highlight_group = 'Statement'
g.ansible_normal_keywords_highlight = 'Statement'
g.ansible_loop_keywords_highlight = 'Statement'
vim.cmd [[let g:ansible_template_syntaxes = {"*.ya?ml.j2": "yaml"}]]

vim.cmd [[syntax on]]
