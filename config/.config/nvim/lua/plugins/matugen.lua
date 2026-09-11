return {
  'daedlock/matugen.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('matugen').setup {
      colors_path = '~/.config/nvim/colors.json',
    }

    vim.cmd.colorscheme 'matugen'

    local sigusr1 = assert(vim.loop.new_signal())

    vim.loop.signal_start(sigusr1, 'sigusr1', function()
      vim.schedule(function()
        vim.defer_fn(function() vim.cmd.colorscheme 'matugen' end, 50)
      end)
    end)
  end,
}
