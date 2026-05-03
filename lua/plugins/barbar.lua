return {
  "romgrk/barbar.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function(_, opts)
    require("barbar").setup(opts)
    local function set_barbar_hl()
      vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#61afef", bold = true })
    end
    set_barbar_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_barbar_hl })
  end,
  opts = {
    animation = true,
    auto_hide = false,
    clickable = true,
    icons = {
      buffer_index = false,
      filetype = { enabled = true },
      button = "×",
    },
  },
}
