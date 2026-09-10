return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function() require('conform').format { async = true } end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = { timeout_ms = 550 },

    default_format_opts = {
      lsp_format = 'fallback',
    },

    formatters_by_ft = {
      python = { 'ruff', 'black' },
      lua = { 'stylua' },
    },
  },
}
