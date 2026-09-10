return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Shows open buffers as tabs
        separator_style = "thin",
        
        -- Crucial: This prevents Neo-tree from pushing the tabs over
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
      }
    })
  end,
}
