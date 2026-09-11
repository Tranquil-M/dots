return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'python',
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },

      auto_install = true,

      highlight = {
        enable = true,
        -- Set this to true if you depend on 'syntax' being enabled (like for folds)
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    }
  end,
}
