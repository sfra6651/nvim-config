local opt = vim.opt

-- Tab / Indentaions
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent =true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true

-- Appearance
opt.relativenumber = true
opt.termguicolors = true
-- opt.colorcolumn = '100'
-- opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 8
--opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
