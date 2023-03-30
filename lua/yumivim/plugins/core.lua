require('yumivim.config').init()

return {
  { 'mokrinsky/yumivim', priority = 10000, lazy = false, config = true },
  -- I don't need autoloading these cause these will be loaded once required
  { 'MunifTanjim/nui.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'b0o/schemastore.nvim' },
  { 'folke/neodev.nvim' }, -- this plugin won't be ever loaded, i just like to have completion bundled inside
  { 'folke/which-key.nvim', lazy = false },
  {
    'RRethy/vim-illuminate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('illuminate').configure {
        delay = 100,
        providers = {
          'treesitter',
          'lsp',
          'regex',
        },
      }
    end,
  },
  -- treesitter
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup { snippet_engine = 'luasnip' }
    end,
  },
  -- package manager
  { 'folke/lazy.nvim' },
  { 'mokrinsky/bufdelete.nvim', event = 'BufReadPre', dev = true },
  { 'nacro90/numb.nvim', event = 'BufReadPre' },
  {
    'ray-x/go.nvim',
    ft = 'go',
    config = function()
      require('go').setup {}
    end,
    dependencies = { 'ray-x/guihua.lua' },
  },
  -- ansible syntax
  { 'pearofducks/ansible-vim', ft = 'yaml.ansible' },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPost',
    config = function()
      require('todo-comments').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    command = 'Trouble',
    config = function()
      require('trouble').setup {}
    end,
  },
}
