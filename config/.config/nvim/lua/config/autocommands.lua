vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  pattern = '*',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'lazygit' then
      local success, events = pcall(require, 'neo-tree.events')
      if success then events.fire_event(events.GIT_EVENT) end
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    local current = args.buf

    local buftype = vim.bo[current].buftype
    if buftype ~= '' then return end

    local filetype = vim.bo[current].filetype
    if filetype == 'neo-tree' or filetype == '' then return end

    if vim.api.nvim_buf_get_name(current) == '' then return end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
        local name = vim.api.nvim_buf_get_name(buf)
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

        if name == '' and #lines == 1 and lines[1] == '' and not vim.bo[buf].modified then vim.api.nvim_buf_delete(buf, { force = true }) end
      end
    end
  end,
})
