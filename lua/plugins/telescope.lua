local config = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')

  telescope.setup({
    defaults = {
      mappings = {
        i = {},
        n = {
            ["dd"] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      hidden = true,
    },
    live_grep = {
      theme = "dropdown",
      previewer = false,
    },
    find_buffers = {
      theme = "dropdown",
      previewer = false,
    }
  },
})
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = {},
}
