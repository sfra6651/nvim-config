local opt = vim.opt

-- Tab / Indentaions
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent =true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true

-- Auto-clear search highlight when not navigating matches (n/N/*/# etc)
vim.on_key(function(char)
  if vim.fn.mode() == 'n' then
    local new_hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace('auto_hlsearch'))

-- Appearance
opt.relativenumber = true
opt.termguicolors = true
opt.guicursor = "a:block,a:blinkwait500-blinkoff500-blinkon500"
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

-- Windows: use Developer PowerShell so cl.exe / cmake / etc. are on PATH
if vim.fn.has("win32") == 1 then
  local vsdevshell = "C:\\Program Files\\Microsoft Visual Studio\\18\\Community\\Common7\\Tools\\Launch-VsDevShell.ps1"
  opt.shell = "pwsh"
  opt.shellcmdflag = table.concat({
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command",
    "$PSStyle.OutputRendering='PlainText';",
    "& '" .. vsdevshell .. "' -SkipAutomaticLocation -Arch amd64 -HostArch amd64 | Out-Null;",
  }, " ")
  opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  opt.shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
  opt.shellquote = ""
  opt.shellxquote = ""
end
