-- my_matrix_color_scheme: minimal matrix colorscheme on a black background.
-- Default text white. Functions, built-ins, and control flow all matrix green.
-- Strings are a slightly brighter muted green; comments are darker italic.
-- Activate with: :colorscheme my_matrix_color_scheme

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'my_matrix_color_scheme'

local c = {
    bg            = '#000000',
    bg_alt        = '#0a0f0a',
    bg_visual     = '#0f3010',
    bg_cursor     = '#0f1f0f',
    fg            = '#d4d4d4', -- default text (off-white)
    fg_dim        = '#008f11', -- dim green for UI chrome (line nums, signs)
    accent_bright = '#39ff14', -- neon green: titles, search match (UI only)
    func          = '#2ee658', -- softened matrix green: functions and methods
    builtin       = '#00b833', -- darker matrix green: built-ins, control flow
    comment       = '#2d5a2d', -- muted dark green: comments
    string        = '#4a8a4a', -- slightly brighter muted green: strings
    operator      = '#7fff7f', -- light matrix green: ::, <, >, &&, etc.
    macro         = '#00ffaa', -- teal-green: macros (#define, function-like macros)
    preproc       = '#1f5a30', -- dim dark green: #include, #define, #ifdef directives
    error         = '#ff3333',
    warning       = '#ffcc00',
    info          = '#00ffff',
    hint          = '#33ff99',
}

local hl = vim.api.nvim_set_hl

-- Editor UI
hl(0, 'Normal',          { fg = c.fg, bg = c.bg })
hl(0, 'NormalFloat',     { fg = c.fg, bg = c.bg_alt })
hl(0, 'FloatBorder',     { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'CursorLine',      { bg = c.bg_cursor })
hl(0, 'CursorLineNr',    { fg = c.accent_bright, bold = true })
hl(0, 'LineNr',          { fg = c.fg_dim })
hl(0, 'SignColumn',      { bg = c.bg })
hl(0, 'VertSplit',       { fg = c.fg_dim })
hl(0, 'WinSeparator',    { fg = c.fg_dim })
hl(0, 'StatusLine',      { fg = c.fg, bg = c.bg_alt })
hl(0, 'StatusLineNC',    { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'Visual',          { bg = c.bg_visual })
hl(0, 'Search',          { fg = c.bg, bg = c.accent_bright })
hl(0, 'IncSearch',       { fg = c.bg, bg = c.accent_bright, bold = true })
hl(0, 'CurSearch',       { fg = c.bg, bg = c.accent_bright, bold = true })
hl(0, 'MatchParen',      { fg = c.accent_bright, bold = true, underline = true })
hl(0, 'Pmenu',           { fg = c.fg, bg = c.bg_alt })
hl(0, 'PmenuSel',        { fg = c.bg, bg = c.accent_bright })
hl(0, 'PmenuSbar',       { bg = c.bg_alt })
hl(0, 'PmenuThumb',      { bg = c.fg_dim })
hl(0, 'TabLine',         { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'TabLineSel',      { fg = c.accent_bright, bg = c.bg })
hl(0, 'TabLineFill',     { bg = c.bg_alt })
hl(0, 'Folded',          { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'FoldColumn',      { fg = c.fg_dim, bg = c.bg })
hl(0, 'NonText',         { fg = c.fg_dim })
hl(0, 'SpecialKey',      { fg = c.fg_dim })
hl(0, 'Whitespace',      { fg = c.fg_dim })
hl(0, 'Conceal',         { fg = c.fg_dim })
hl(0, 'Directory',       { fg = c.accent_bright })
hl(0, 'Title',           { fg = c.accent_bright, bold = true })
hl(0, 'ColorColumn',     { bg = c.bg_alt })
hl(0, 'Cursor',          { fg = c.bg, bg = c.accent_bright })
hl(0, 'QuickFixLine',    { bg = c.bg_visual })

-- Messages
hl(0, 'ErrorMsg',        { fg = c.error })
hl(0, 'WarningMsg',      { fg = c.warning })
hl(0, 'ModeMsg',         { fg = c.fg })
hl(0, 'MoreMsg',         { fg = c.fg })
hl(0, 'Question',        { fg = c.accent_bright })

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
hl(0, 'DiffAdd',         { fg = c.accent_bright, bg = '#0a2010' })
hl(0, 'DiffChange',      { bg = '#0a1a20' })
hl(0, 'DiffDelete',      { fg = c.error, bg = '#200a0a' })
hl(0, 'DiffText',        { fg = c.accent_bright, bg = '#0a2530' })
hl(0, 'GitSignsAdd',     { fg = c.accent_bright })
hl(0, 'GitSignsChange',  { fg = c.warning })
hl(0, 'GitSignsDelete',  { fg = c.error })

-- Standard syntax groups
hl(0, 'Comment',         { fg = c.comment, italic = true })
-- Strings: slightly brighter than comments
hl(0, 'String',          { fg = c.string })
hl(0, 'Character',       { fg = c.string })

-- Numbers: default white (literals, not built-ins)
hl(0, 'Number',          { fg = c.fg })
hl(0, 'Float',           { fg = c.fg })
-- Booleans: purple (built-in constants: true/false)
hl(0, 'Boolean',         { fg = c.builtin })

hl(0, 'Identifier',      { fg = c.fg })

-- Functions: blue
hl(0, 'Function',        { fg = c.func })

-- Control flow: purple. Other keywords (class, struct, namespace, using): default fg.
hl(0, 'Statement',       { fg = c.builtin })
hl(0, 'Conditional',     { fg = c.builtin })
hl(0, 'Repeat',          { fg = c.builtin })
hl(0, 'Label',           { fg = c.builtin })
hl(0, 'Exception',       { fg = c.builtin })
hl(0, 'Keyword',         { fg = c.fg })
hl(0, 'Operator',        { fg = c.operator })

-- Preprocessor (#include, #define, etc.): dim dark green for directives, teal for macro names
hl(0, 'PreProc',         { fg = c.preproc })
hl(0, 'Include',         { fg = c.preproc })
hl(0, 'Define',          { fg = c.macro })
hl(0, 'Macro',           { fg = c.macro })
hl(0, 'PreCondit',       { fg = c.preproc })

-- Types and storage keywords: default fg (user-defined types unchanged)
hl(0, 'Type',            { fg = c.fg })
hl(0, 'Structure',       { fg = c.fg })
hl(0, 'StorageClass',    { fg = c.builtin }) -- static, extern, constexpr, register
hl(0, 'Typedef',         { fg = c.builtin })

hl(0, 'Special',         { fg = c.accent_bright })
hl(0, 'SpecialChar',     { fg = c.accent_bright })
hl(0, 'Tag',             { fg = c.fg })
hl(0, 'Delimiter',       { fg = c.fg })
hl(0, 'SpecialComment',  { fg = c.comment, italic = true })
hl(0, 'Debug',           { fg = c.warning })

hl(0, 'Underlined',      { underline = true })
hl(0, 'Ignore',          { fg = c.fg_dim })
hl(0, 'Error',           { fg = c.error })
hl(0, 'Todo',            { fg = c.warning, bold = true })

-- Constants (built-in like nullptr, NULL, etc.): purple
hl(0, 'Constant',        { fg = c.builtin })

-- Treesitter
hl(0, '@comment',              { link = 'Comment' })
hl(0, '@string',               { link = 'String' })
hl(0, '@string.escape',        { fg = c.fg })
hl(0, '@number',               { link = 'Number' })
hl(0, '@boolean',              { link = 'Boolean' })

hl(0, '@keyword',              { link = 'Keyword' })
hl(0, '@keyword.return',       { fg = c.builtin })
hl(0, '@keyword.exception',    { fg = c.builtin })
hl(0, '@keyword.conditional',  { fg = c.builtin })
hl(0, '@keyword.repeat',       { fg = c.builtin })
hl(0, '@keyword.operator',     { fg = c.operator })
hl(0, '@keyword.import',       { fg = c.preproc })
hl(0, '@conditional',          { fg = c.builtin })
hl(0, '@repeat',               { fg = c.builtin })
hl(0, '@exception',            { fg = c.builtin })
hl(0, '@label',                { fg = c.builtin })

hl(0, '@function',             { link = 'Function' })
hl(0, '@function.call',        { fg = c.func })
hl(0, '@function.builtin',     { fg = c.func })
hl(0, '@function.macro',       { fg = c.macro })
hl(0, '@method',               { fg = c.func })
hl(0, '@method.call',          { fg = c.func })

hl(0, '@variable',             { fg = c.fg })
hl(0, '@variable.builtin',     { fg = c.fg }) -- this, self: keep default fg
hl(0, '@constant',             { fg = c.fg })      -- user constants stay default
hl(0, '@constant.builtin',     { fg = c.builtin }) -- nullptr, NULL, true, false
hl(0, '@constant.macro',       { fg = c.macro })

hl(0, '@operator',             { fg = c.operator })
hl(0, '@punctuation',          { fg = c.fg })
hl(0, '@punctuation.bracket',  { fg = c.fg })
hl(0, '@punctuation.delimiter',{ fg = c.operator }) -- :: in cpp, etc.
hl(0, '@punctuation.special',  { fg = c.accent_bright })

-- Types: user-defined stay fg, only built-in types are purple
hl(0, '@type',                 { fg = c.fg })
hl(0, '@type.builtin',         { fg = c.builtin }) -- int, bool, void, auto, char
hl(0, '@type.definition',      { fg = c.fg })
hl(0, '@type.qualifier',       { fg = c.builtin }) -- const, volatile, static, constexpr
hl(0, '@keyword.modifier',     { fg = c.builtin }) -- constexpr, static, inline (newer ts)
hl(0, '@keyword.storage',      { fg = c.builtin }) -- static, extern
hl(0, '@constructor',          { fg = c.fg })
hl(0, '@field',                { fg = c.fg })
hl(0, '@property',             { fg = c.fg })
hl(0, '@variable.member',      { fg = c.fg })
hl(0, '@parameter',            { fg = c.fg })
hl(0, '@attribute',            { fg = c.fg })
hl(0, '@namespace',            { fg = c.fg })

hl(0, '@preproc',              { fg = c.preproc })
hl(0, '@include',              { fg = c.preproc })
hl(0, '@define',               { fg = c.macro })
hl(0, '@keyword.directive',    { fg = c.preproc }) -- newer ts: #include, #if, #ifdef

-- Markup
hl(0, '@tag',                  { fg = c.fg })
hl(0, '@tag.attribute',        { fg = c.fg })
hl(0, '@tag.delimiter',        { fg = c.fg_dim })
hl(0, '@markup.heading',       { fg = c.accent_bright, bold = true })
hl(0, '@markup.link',          { fg = c.accent_bright, underline = true })
hl(0, '@markup.raw',           { fg = c.string })
hl(0, '@markup.list',          { fg = c.fg })
hl(0, '@markup.strong',        { bold = true })
hl(0, '@markup.italic',        { italic = true })

-- LSP semantic tokens (override treesitter; clangd, etc.)
-- User-defined types/members → default fg
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
hl(0, '@lsp.type.namespace',     { fg = c.fg })
hl(0, '@lsp.type.enumMember',    { fg = c.fg })
-- Functions/methods → blue. Macros/keywords → default fg.
hl(0, '@lsp.type.function',      { fg = c.func })
hl(0, '@lsp.type.method',        { fg = c.func })
hl(0, '@lsp.type.macro',         { fg = c.macro })
hl(0, '@lsp.type.keyword',       { fg = c.fg })
hl(0, '@lsp.type.operator',      { fg = c.operator })
hl(0, '@lsp.type.modifier',      { fg = c.builtin }) -- clangd: constexpr, static, etc.
hl(0, '@lsp.type.string',        { link = 'String' })
hl(0, '@lsp.type.number',        { link = 'Number' })
hl(0, '@lsp.type.comment',       { link = 'Comment' })
-- LSP modifiers
hl(0, '@lsp.typemod.variable.defaultLibrary', { fg = c.builtin })
hl(0, '@lsp.typemod.function.defaultLibrary', { fg = c.func })

-- Common plugins
hl(0, 'TelescopeBorder',       { fg = c.fg_dim, bg = c.bg })
hl(0, 'TelescopeNormal',       { fg = c.fg, bg = c.bg })
hl(0, 'TelescopeSelection',    { fg = c.accent_bright, bg = c.bg_visual, bold = true })
hl(0, 'TelescopeMatching',     { fg = c.accent_bright, bold = true })
hl(0, 'TelescopePromptPrefix', { fg = c.accent_bright })

hl(0, 'NvimTreeNormal',          { fg = c.fg, bg = c.bg })
hl(0, 'NvimTreeFolderName',      { fg = c.fg })
hl(0, 'NvimTreeOpenedFolderName',{ fg = c.accent_bright, bold = true })
hl(0, 'NvimTreeRootFolder',      { fg = c.accent_bright, bold = true })
hl(0, 'NvimTreeGitDirty',        { fg = c.warning })
hl(0, 'NvimTreeGitNew',          { fg = c.accent_bright })
hl(0, 'NvimTreeIndentMarker',    { fg = c.fg_dim })
