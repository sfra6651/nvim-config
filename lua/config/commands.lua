vim.api.nvim_create_user_command('Keymaps', function()
  vim.cmd('e ' .. vim.fn.stdpath('config') .. '/lua/config/keymaps.lua')
end, { desc = 'Open keymaps file' })
