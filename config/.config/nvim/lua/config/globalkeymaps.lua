vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Cancel Highlight Search' })

vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { silent = true })

vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { silent = true })

vim.keymap.set('n', '<leader>bh', function()
  local lines = math.floor(vim.o.lines * 0.2)

  vim.cmd(lines .. 'split | terminal')

  vim.opt_local.buflisted = false
end, { desc = 'Open [B]ash terminal [H]orizontally split' })

vim.keymap.set('n', '<leader>bv', function()
  local columns = math.floor(vim.o.columns * 0.2)

  vim.cmd(columns .. 'vsplit | terminal')

  vim.opt_local.buflisted = false
end, { desc = 'Open [B]ash terminal [V]ertically split' })

vim.keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<CR>', { silent = true, desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>ed', function()
  require('telescope.builtin').find_files {
    prompt_tile = 'Neo-tree: Open Directory',
    cwd = '~',
    find_command = {
      'fd',
      '--type',
      'd',
      '--hidden',
      '--absolute-path',
      '--exclude',
      '.git',
      '--exclude',
      '.cache',
      '--exclude',
      'node_modules',
      '--exclude',
      '.npm',
    },

    attach_mappings = function(prompt_bufnr, _)
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'

      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          local target_dir = selection.value

          vim.api.nvim_set_current_dir(target_dir)
          vim.cmd('Neotree ' .. target_dir)
        end
      end)
      return true
    end,
  }
end, { desc = 'Open Directory in Neo-tree' })

vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Tab' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<S-x>', function()
  local current_buf = vim.api.nvim_get_current_buf()

  vim.cmd 'bprevious'

  vim.api.nvim_buf_delete(current_buf, { force = false })
end, { desc = 'Close Current Tab' })

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line

  jump = { float = true },
}
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- works on my machine! (kitty)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
