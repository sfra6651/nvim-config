-- my_minimal: matrix/cyber green minimal colorscheme
-- Activate with: :colorscheme my_minimal

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'my_minimal'

local c = {
    bg          = '#000000',
    bg_alt      = '#0a0f0a',
    bg_visual   = '#0f3010',
    bg_cursor   = '#0f1f0f',
    fg          = '#00ff41', -- matrix green
    fg_dim      = '#008f11',
    fg_bright   = '#39ff14',
    comment     = '#2d5a2d',
    string      = '#00cc33',
    number      = '#7fff7f',
    keyword     = '#00ff66',
    constant    = '#7fff00',
    error       = '#ff3333',
    warning     = '#ffcc00',
    info        = '#00ffff',
    hint        = '#33ff99',
}

local hl = vim.api.nvim_set_hl

-- Editor UI
hl(0, 'Normal',          { fg = c.fg, bg = c.bg })
hl(0, 'NormalFloat',     { fg = c.fg, bg = c.bg_alt })
hl(0, 'FloatBorder',     { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'CursorLine',      { bg = c.bg_cursor })
hl(0, 'CursorLineNr',    { fg = c.fg_bright, bold = true })
hl(0, 'LineNr',          { fg = c.fg_dim })
hl(0, 'SignColumn',      { bg = c.bg })
hl(0, 'VertSplit',       { fg = c.fg_dim })
hl(0, 'WinSeparator',    { fg = c.fg_dim })
hl(0, 'StatusLine',      { fg = c.fg, bg = c.bg_alt })
hl(0, 'StatusLineNC',    { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'Visual',          { bg = c.bg_visual })
hl(0, 'Search',          { fg = c.bg, bg = c.fg_bright })
hl(0, 'IncSearch',       { fg = c.bg, bg = c.fg_bright, bold = true })
hl(0, 'CurSearch',       { fg = c.bg, bg = c.fg_bright, bold = true })
hl(0, 'MatchParen',      { fg = c.fg_bright, bold = true, underline = true })
hl(0, 'Pmenu',           { fg = c.fg, bg = c.bg_alt })
hl(0, 'PmenuSel',        { fg = c.bg, bg = c.fg_bright })
hl(0, 'PmenuSbar',       { bg = c.bg_alt })
hl(0, 'PmenuThumb',      { bg = c.fg_dim })
hl(0, 'TabLine',         { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'TabLineSel',      { fg = c.fg_bright, bg = c.bg })
hl(0, 'TabLineFill',     { bg = c.bg_alt })
hl(0, 'Folded',          { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'FoldColumn',      { fg = c.fg_dim, bg = c.bg })
hl(0, 'NonText',         { fg = c.fg_dim })
hl(0, 'SpecialKey',      { fg = c.fg_dim })
hl(0, 'Whitespace',      { fg = c.fg_dim })
hl(0, 'Conceal',         { fg = c.fg_dim })
hl(0, 'Directory',       { fg = c.fg_bright })
hl(0, 'Title',           { fg = c.fg_bright, bold = true })
hl(0, 'ColorColumn',     { bg = c.bg_alt })
hl(0, 'Cursor',          { fg = c.bg, bg = c.fg_bright })
hl(0, 'QuickFixLine',    { bg = c.bg_visual })

-- Messages
hl(0, 'ErrorMsg',        { fg = c.error })
hl(0, 'WarningMsg',      { fg = c.warning })
hl(0, 'ModeMsg',         { fg = c.fg })
hl(0, 'MoreMsg',         { fg = c.fg })
hl(0, 'Question',        { fg = c.fg_bright })

-- Diagnostics
hl(0, 'DiagnosticError', { fg = c.error })
hl(0, 'DiagnosticWarn',  { fg = c.warning })
hl(0, 'DiagnosticInfo',  { fg = c.info })
hl(0, 'DiagnosticHint',  { fg = c.hint })
hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = c.error })
hl(0, 'DiagnosticUnderlineWarn',  { undercurl = true, sp = c.warning })
hl(0, 'DiagnosticUnderlineInfo',  { undercurl = true, sp = c.info })
hl(0, 'DiagnosticUnderlineHint',  { undercurl = true, sp = c.hint })

-- Diff / git
hl(0, 'DiffAdd',         { fg = c.fg_bright, bg = '#0a2010' })
hl(0, 'DiffChange',      { bg = '#0a1a20' })
hl(0, 'DiffDelete',      { fg = c.error, bg = '#200a0a' })
hl(0, 'DiffText',        { fg = c.fg_bright, bg = '#0a2530' })
hl(0, 'GitSignsAdd',     { fg = c.fg_bright })
hl(0, 'GitSignsChange',  { fg = c.warning })
hl(0, 'GitSignsDelete',  { fg = c.error })

-- Standard syntax (minimal: most things default to fg)
hl(0, 'Comment',         { fg = c.comment, italic = true })
hl(0, 'String',          { fg = c.string })
hl(0, 'Character',       { fg = c.string })
hl(0, 'Number',          { fg = c.number })
hl(0, 'Boolean',         { fg = c.number })
hl(0, 'Float',           { fg = c.number })

hl(0, 'Identifier',      { fg = c.fg })
hl(0, 'Function',        { fg = c.fg_bright })

hl(0, 'Statement',       { fg = c.keyword })
hl(0, 'Conditional',     { fg = c.keyword })
hl(0, 'Repeat',          { fg = c.keyword })
hl(0, 'Label',           { fg = c.keyword })
hl(0, 'Operator',        { fg = c.fg })
hl(0, 'Keyword',         { fg = c.keyword })
hl(0, 'Exception',       { fg = c.keyword })

hl(0, 'PreProc',         { fg = c.fg_dim })
hl(0, 'Include',         { fg = c.fg_dim })
hl(0, 'Define',          { fg = c.fg_dim })
hl(0, 'Macro',           { fg = c.fg_dim })
hl(0, 'PreCondit',       { fg = c.fg_dim })

-- Minimal: no special highlighting for types
hl(0, 'Type',            { fg = c.fg })
hl(0, 'StorageClass',    { fg = c.fg })
hl(0, 'Structure',       { fg = c.fg })
hl(0, 'Typedef',         { fg = c.fg })

hl(0, 'Special',         { fg = c.fg_bright })
hl(0, 'SpecialChar',     { fg = c.fg_bright })
hl(0, 'Tag',             { fg = c.fg })
hl(0, 'Delimiter',       { fg = c.fg })
hl(0, 'SpecialComment',  { fg = c.comment, italic = true })
hl(0, 'Debug',           { fg = c.warning })

hl(0, 'Underlined',      { underline = true })
hl(0, 'Ignore',          { fg = c.fg_dim })
hl(0, 'Error',           { fg = c.error })
hl(0, 'Todo',            { fg = c.warning, bold = true })

hl(0, 'Constant',        { fg = c.constant })

-- Treesitter
hl(0, '@comment',              { link = 'Comment' })
hl(0, '@string',               { link = 'String' })
hl(0, '@string.escape',        { fg = c.fg_bright })
hl(0, '@number',               { link = 'Number' })
hl(0, '@boolean',              { link = 'Boolean' })
hl(0, '@keyword',              { link = 'Keyword' })
hl(0, '@keyword.return',       { fg = c.keyword })
hl(0, '@function',             { link = 'Function' })
hl(0, '@function.call',        { fg = c.fg_bright })
hl(0, '@function.builtin',     { fg = c.fg_bright })
hl(0, '@function.macro',       { fg = c.fg_dim })
hl(0, '@method',               { link = 'Function' })
hl(0, '@method.call',          { fg = c.fg_bright })
hl(0, '@variable',             { fg = c.fg })
hl(0, '@variable.builtin',     { fg = c.fg })
hl(0, '@constant',             { link = 'Constant' })
hl(0, '@constant.builtin',     { link = 'Constant' })
hl(0, '@constant.macro',       { link = 'Constant' })
hl(0, '@operator',             { fg = c.fg })
hl(0, '@punctuation',          { fg = c.fg })
hl(0, '@punctuation.bracket',  { fg = c.fg })
hl(0, '@punctuation.delimiter',{ fg = c.fg })
hl(0, '@punctuation.special',  { fg = c.fg_bright })

-- Minimal: types, fields, properties, members all default fg
hl(0, '@type',                 { fg = c.fg })
hl(0, '@type.builtin',         { fg = c.fg })
hl(0, '@type.definition',      { fg = c.fg })
hl(0, '@type.qualifier',       { fg = c.fg })
hl(0, '@constructor',          { fg = c.fg })
hl(0, '@field',                { fg = c.fg })
hl(0, '@property',             { fg = c.fg })
hl(0, '@variable.member',      { fg = c.fg })
hl(0, '@parameter',            { fg = c.fg })
hl(0, '@attribute',            { fg = c.fg })
hl(0, '@namespace',            { fg = c.fg })

-- Markup
hl(0, '@tag',                  { fg = c.fg })
hl(0, '@tag.attribute',        { fg = c.fg })
hl(0, '@tag.delimiter',        { fg = c.fg_dim })
hl(0, '@markup.heading',       { fg = c.fg_bright, bold = true })
hl(0, '@markup.link',          { fg = c.fg_bright, underline = true })
hl(0, '@markup.raw',           { fg = c.string })
hl(0, '@markup.list',          { fg = c.fg })
hl(0, '@markup.strong',        { bold = true })
hl(0, '@markup.italic',        { italic = true })

-- LSP semantic tokens (override treesitter)
hl(0, '@lsp.type.type',          { fg = c.fg })
hl(0, '@lsp.type.class',         { fg = c.fg })
hl(0, '@lsp.type.struct',        { fg = c.fg })
hl(0, '@lsp.type.enum',          { fg = c.fg })
hl(0, '@lsp.type.interface',     { fg = c.fg })
hl(0, '@lsp.type.typeParameter', { fg = c.fg })
hl(0, '@lsp.type.property',      { fg = c.fg })
hl(0, '@lsp.type.member',        { fg = c.fg })
hl(0, '@lsp.type.field',         { fg = c.fg })
hl(0, '@lsp.type.parameter',     { fg = c.fg })
hl(0, '@lsp.type.variable',      { fg = c.fg })
hl(0, '@lsp.type.enumMember',    { link = 'Constant' })
hl(0, '@lsp.type.namespace',     { fg = c.fg })
hl(0, '@lsp.type.function',      { link = 'Function' })
hl(0, '@lsp.type.method',        { link = 'Function' })
hl(0, '@lsp.type.macro',         { fg = c.fg_dim })
hl(0, '@lsp.type.keyword',       { link = 'Keyword' })
hl(0, '@lsp.type.string',        { link = 'String' })
hl(0, '@lsp.type.number',        { link = 'Number' })
hl(0, '@lsp.type.comment',       { link = 'Comment' })

-- Common plugins
hl(0, 'TelescopeBorder',       { fg = c.fg_dim, bg = c.bg })
hl(0, 'TelescopeNormal',       { fg = c.fg, bg = c.bg })
hl(0, 'TelescopeSelection',    { fg = c.fg_bright, bg = c.bg_visual, bold = true })
hl(0, 'TelescopeMatching',     { fg = c.fg_bright, bold = true })
hl(0, 'TelescopePromptPrefix', { fg = c.fg_bright })

hl(0, 'NvimTreeNormal',          { fg = c.fg, bg = c.bg })
hl(0, 'NvimTreeFolderName',      { fg = c.fg })
hl(0, 'NvimTreeOpenedFolderName',{ fg = c.fg_bright, bold = true })
hl(0, 'NvimTreeRootFolder',      { fg = c.fg_bright, bold = true })
hl(0, 'NvimTreeGitDirty',        { fg = c.warning })
hl(0, 'NvimTreeGitNew',          { fg = c.fg_bright })
hl(0, 'NvimTreeIndentMarker',    { fg = c.fg_dim })
