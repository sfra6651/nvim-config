-- Directory Navigation
vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = 'focus file tree'})
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = 'toggle file tree'})


-- Window management 
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {desc = 'split vertically'})
vim.keymap.set("n", "<leader>sh", ":split<CR>", {desc = 'split horizontal'})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope <CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")

-- Indenting
vim.keymap.set("v", "<", ">gv")
vim.keymap.set("v", ">", "<gv")

--Scrolling
vim.keymap.set("n", "<C-j>", "<C-e>")
vim.keymap.set("n", "<C-k>", "<C-y>")

--LSP
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

--Errors
-- Custom function to show diagnostics in a floating window with specific settings
function ShowDiagnosticsWithConfig()
  local opts = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    width = 80,  -- Set max width
    height = 20, -- Set max height
    wrap = true,
  }
  vim.diagnostic.open_float(nil, opts)
end

-- Key mapping to call the custom diagnostics function
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua ShowDiagnosticsWithConfig()<CR>', { noremap=true, silent=true })
