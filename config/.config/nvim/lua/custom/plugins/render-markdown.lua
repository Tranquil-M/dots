return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- or nvim-web-devicons
    opts = {
        enabled = true,
        render_modes = { 'n', 'c', 't' }, -- Modes where rendering is active (Normal, Command, Terminal)
    },
}
