-- Directory Navigation
vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { desc = 'focus file tree'})
vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", {  desc = 'toggle file tree'})

-- Buffer navigation
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>p', ':bprev<CR>', { desc = 'Previous buffer' })

-- Buffer navigation (barbar.nvim) -- linux/tabs
-- vim.keymap.set('n', '<leader>n', '<cmd>BufferNext<CR>', { desc = 'Next buffer' })
-- vim.keymap.set('n', '<leader>p', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
-- vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })

-- Save
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", {desc = "write file"})

-- Window management 
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", {desc = 'split vertically'})
vim.keymap.set("n", "<leader>hs", ":split<CR>", {desc = 'split horizontal'})
vim.keymap.set('n', '<leader>t', '<cmd>split | terminal<cr>', { desc = 'Terminal horizontal split' })
vim.keymap.set('n', '<leader>vt', '<cmd>vsplit | terminal<cr>', { desc = 'Terminal vertical split' })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope <CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")

-- Indenting
vim.keymap.set("v", "<", ">gv")
vim.keymap.set("v", ">", "<gv")

--Scrolling
vim.keymap.set("n", "<C-j>", "<C-e>")
vim.keymap.set("n", "<C-k>", "<C-y>")

--LSP
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true, desc = 'Rename symbol' })


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

