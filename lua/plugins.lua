return {
  -- I don't need autoloading these cause these will be loaded once required
  { 'MunifTanjim/nui.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- completion and snippets
  { 'folke/neodev.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
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
  {
    'SmiteshP/nvim-navic',
    opts = {
      highlight = true,
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = 'ﴯ ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = 'ℰ',
        Interface = 'ﰮ ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = '⊨ ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = 'NULL',
        EnumMember = ' ',
        Struct = 'פּ ',
        Event = '',
        Operator = ' ',
        TypeParameter = ' ',
      },
    },
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
  { 'nacro90/numb.nvim' },
  {
    'ray-x/go.nvim',
    ft = 'go',
    config = function()
      require('go').setup {}
    end,
    dependencies = { 'ray-x/guihua.lua' },
  },
  -- use "gbprod/cutlass.nvim"
  -- git changes
  { 'airblade/vim-gitgutter' },
  -- ansible syntax
  { 'pearofducks/ansible-vim', ft = 'yaml.ansible' },
  { 'junegunn/vim-easy-align' },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  },
}
