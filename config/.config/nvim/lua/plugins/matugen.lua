return {
  {
    "daedlock/matugen.nvim",
    lazy = false,
    priority = 1000,

    config = function()

      require("matugen").setup({
        colors_path = vim.fn.expand("~/.config/nvim/matugen.json"),
      })

      vim.cmd.colorscheme("matugen")
    end,
  },
}
