return {
  'brianhuster/live-preview.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  require('livepreview.config').set {
    dynamic_root = true,
  },
}
