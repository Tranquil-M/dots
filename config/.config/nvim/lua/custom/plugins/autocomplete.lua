return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',

  opts = {
    keymap = {
        preset = 'default',
        ['<C-y>'] = { 'show', 'fallback' },
        ['<C-Space>'] = { 'select_and_accept', 'fallback' },
        ['<C-Tab>'] = { 'select_next', 'fallback' },
        ['<C-S-Tab>'] = { 'select_prev', 'fallback' },
      },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}
