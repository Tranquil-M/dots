-- leader key, must be defined before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- global var used to enabled or disable nerd fonts in other plugins; non-essential
vim.g.have_nerd_font = true

-- options
require 'config.options'

-- keymaps that i didn't put into any plugins
require 'config.globalkeymaps'

-- auto commands that I uh... didn't put into any plugins. again
require 'config.autocommands'

-- install lazy.nvim if it wasn't built already
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  { import = 'plugins' },
}
