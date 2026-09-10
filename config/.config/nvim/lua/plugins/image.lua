return {
  "3rd/image.nvim",
  dependencies = {
    -- Required if you don't install the 'magick' rock globally via system package manager
    { "vhyrro/luarocks.nvim", opts = { rocks = { "magick" } } },
  },
  opts = {
    backend = "kitty", -- Change to "sixel" if your terminal uses Sixel instead
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50, -- Caps the preview size so it fits nicely
    window_overlap_clear_enabled = false, 
    
    buffer_images = true, -- Renders the image when you open a image file directly
  },
}
