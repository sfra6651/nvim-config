-- my_zig: dark scheme inspired by ziglang.org/documentation. Soft azure
-- functions (declarations + calls), pale-gold user types, mauve keywords
-- and built-in types, amber @builtins, olive-italic comments, muted-green
-- strings, coral numbers / booleans / logical operators. Tuned for low
-- contrast / long-session readability.
-- Activate with: :colorscheme my_zig

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'my_zig'

local c = {
    bg            = '#1a1a1a', -- dark neutral, slight warmth
    bg_alt        = '#232323', -- floats, statusline, pmenu
    bg_visual     = '#3d3825', -- warm selection (picks up amber)
    bg_cursor     = '#1f1f1f',
    fg            = '#d8d4c8', -- warm off-white: default text (identifiers, calls, fields)
    fg_dim        = '#777777', -- line numbers, splits, UI chrome
    accent_bright = '#d18b30', -- amber: titles, search, UI accent
    func          = '#6cb0eb', -- azure: user-defined functions (declarations + calls)
    func_std      = '#5dc4b7', -- teal: non-user functions (stdlib / generic-tagged by zls)
    builtin       = '#c084d4', -- mauve: keywords, control flow, built-in types
    type          = '#e6cd6b', -- gold: user-defined types
    comment       = '#6b6450', -- dim olive: comments (italic), low contrast
    string        = '#93c275', -- green: strings
    operator      = '#d8d4c8', -- fg-level: =, +, /, ::, etc.
    macro         = '#d18b30', -- amber (same family as @builtins)
    preproc       = '#a89866', -- olive
    error         = '#e87b58', -- coral
    warning       = '#e5b14e',
    info          = '#6cb0eb',
    hint          = '#93c275',
    zig_builtin   = '#d18b30', -- amber: @import, @sizeOf, @TypeOf, @"quoted ident"
    number        = '#e87b58', -- coral: numbers, booleans, null/undefined, and/or
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
hl(0, 'DiffAdd',         { bg = '#1c2620' })
hl(0, 'DiffChange',      { bg = '#1a242e' })
hl(0, 'DiffDelete',      { fg = c.error, bg = '#2a1a1a' })
hl(0, 'DiffText',        { bg = '#1f3340' })
hl(0, 'GitSignsAdd',     { fg = c.string })
hl(0, 'GitSignsChange',  { fg = c.warning })
hl(0, 'GitSignsDelete',  { fg = c.error })

-- Standard syntax groups
hl(0, 'Comment',         { fg = c.comment, italic = true })
hl(0, 'String',          { fg = c.string })
hl(0, 'Character',       { fg = c.string })

hl(0, 'Number',          { fg = c.number })
hl(0, 'Float',           { fg = c.number })
hl(0, 'Boolean',         { fg = c.number })

hl(0, 'Identifier',      { fg = c.fg })

hl(0, 'Function',        { fg = c.func })

hl(0, 'Statement',       { fg = c.builtin })
hl(0, 'Conditional',     { fg = c.builtin })
hl(0, 'Repeat',          { fg = c.builtin })
hl(0, 'Label',           { fg = c.builtin })
hl(0, 'Exception',       { fg = c.builtin })
hl(0, 'Keyword',         { fg = c.builtin })
hl(0, 'Operator',        { fg = c.operator })

hl(0, 'PreProc',         { fg = c.preproc })
hl(0, 'Include',         { fg = c.preproc })
hl(0, 'Define',          { fg = c.macro })
hl(0, 'Macro',           { fg = c.macro })
hl(0, 'PreCondit',       { fg = c.preproc })

hl(0, 'Type',            { fg = c.type })
hl(0, 'Structure',       { fg = c.fg })
hl(0, 'StorageClass',    { fg = c.builtin })
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

hl(0, 'Constant',        { fg = c.number })

-- Treesitter
hl(0, '@comment',              { link = 'Comment' })
hl(0, '@string',               { link = 'String' })
hl(0, '@string.escape',        { fg = c.accent_bright })
hl(0, '@number',               { link = 'Number' })
hl(0, '@number.float',         { link = 'Number' })
hl(0, '@boolean',              { link = 'Boolean' })

hl(0, '@keyword',              { fg = c.builtin })
hl(0, '@keyword.return',       { fg = c.builtin })
hl(0, '@keyword.exception',    { fg = c.builtin })
hl(0, '@keyword.conditional',  { fg = c.builtin })
hl(0, '@keyword.repeat',       { fg = c.builtin })
hl(0, '@keyword.operator',     { fg = c.number }) -- and, or, orelse: coral like booleans
hl(0, '@keyword.import',       { fg = c.builtin })
hl(0, '@conditional',          { fg = c.builtin })
hl(0, '@repeat',               { fg = c.builtin })
hl(0, '@exception',            { fg = c.builtin })
hl(0, '@label',                { fg = c.builtin })

hl(0, '@function',             { link = 'Function' })
hl(0, '@function.call',        { fg = c.func })
hl(0, '@function.builtin',     { fg = c.zig_builtin })
hl(0, '@function.macro',       { fg = c.macro })
hl(0, '@method',               { fg = c.func })
hl(0, '@method.call',          { fg = c.func })

hl(0, '@variable',             { fg = c.fg })
hl(0, '@variable.builtin',     { fg = c.fg })
hl(0, '@constant',             { fg = c.fg })
hl(0, '@constant.builtin',     { fg = c.number }) -- null, undefined, unreachable
hl(0, '@constant.macro',       { fg = c.macro })

hl(0, '@operator',             { fg = c.operator })
hl(0, '@punctuation',          { fg = c.fg })
hl(0, '@punctuation.bracket',  { fg = c.fg })
hl(0, '@punctuation.delimiter',{ fg = c.operator })
hl(0, '@punctuation.special',  { fg = c.accent_bright })

hl(0, '@type',                 { fg = c.type })   -- user-defined types: pale gold
hl(0, '@type.builtin',         { fg = c.builtin }) -- i32, f32, u8, void, c_int: mauve
hl(0, '@type.definition',      { fg = c.type })
hl(0, '@type.qualifier',       { fg = c.builtin })
hl(0, '@keyword.modifier',     { fg = c.builtin })
hl(0, '@keyword.storage',      { fg = c.builtin })

-- zig-specific treesitter captures
hl(0, '@function.builtin.zig', { fg = c.zig_builtin })          -- @import, @sizeOf, @TypeOf
hl(0, '@keyword.type.zig',     { fg = c.builtin }) -- struct, union, enum, opaque
hl(0, '@keyword.coroutine.zig',{ fg = c.builtin }) -- async, await, suspend, resume
hl(0, '@keyword.function.zig', { fg = c.builtin }) -- fn

hl(0, '@constructor',          { fg = c.type })
hl(0, '@field',                { fg = c.fg })
hl(0, '@property',             { fg = c.fg })
hl(0, '@variable.member',      { fg = c.fg })
hl(0, '@parameter',            { fg = c.fg })
hl(0, '@attribute',            { fg = c.fg })
hl(0, '@namespace',            { fg = c.fg })

hl(0, '@preproc',              { fg = c.preproc })
hl(0, '@include',              { fg = c.builtin })
hl(0, '@define',               { fg = c.macro })
hl(0, '@keyword.directive',    { fg = c.preproc })

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

-- LSP semantic tokens
hl(0, '@lsp.type.type',          { fg = c.type })  -- user-defined types: pale gold
hl(0, '@lsp.type.class',         { fg = c.type })
hl(0, '@lsp.type.struct',        { fg = c.type })
hl(0, '@lsp.type.enum',          { fg = c.type })
hl(0, '@lsp.type.interface',     { fg = c.type })
hl(0, '@lsp.type.typeParameter', { fg = c.type })
hl(0, '@lsp.type.property',      { fg = c.fg })
hl(0, '@lsp.type.member',        { fg = c.fg })
hl(0, '@lsp.type.field',         { fg = c.fg })
hl(0, '@lsp.type.parameter',     { fg = c.fg })
hl(0, '@lsp.type.variable',      { fg = c.fg })
hl(0, '@lsp.type.namespace',     { fg = c.fg })
hl(0, '@lsp.type.enumMember',    { fg = c.fg })
hl(0, '@lsp.type.function',      { fg = c.func }) -- all functions blue
hl(0, '@lsp.type.method',        { fg = c.func })
hl(0, '@lsp.type.macro',         { fg = c.macro })
hl(0, '@lsp.type.keyword',       { fg = c.builtin })
hl(0, '@lsp.type.operator',      { fg = c.operator })
hl(0, '@lsp.type.modifier',      { fg = c.builtin })
hl(0, '@lsp.type.string',        { link = 'String' })
hl(0, '@lsp.type.number',        { link = 'Number' })
hl(0, '@lsp.type.comment',       { link = 'Comment' })
hl(0, '@lsp.typemod.variable.defaultLibrary', { fg = c.number })
-- Non-user functions (stdlib + anything zls tags generic/defaultLibrary) → teal.
-- User-defined plain functions hit @lsp.type.function (no modifier) → azure via c.func.
hl(0, '@lsp.typemod.function.defaultLibrary', { fg = c.func_std })
hl(0, '@lsp.typemod.method.defaultLibrary',   { fg = c.func_std })
hl(0, '@lsp.typemod.function.generic',        { fg = c.func_std })
hl(0, '@lsp.typemod.method.generic',          { fg = c.func_std })
hl(0, '@lsp.typemod.function.declaration',    { fg = c.func })
hl(0, '@lsp.typemod.method.declaration',      { fg = c.func })

-- zls reports zig builtins / error tags / keyword literals
hl(0, '@lsp.type.builtin.zig',        { fg = c.zig_builtin })
hl(0, '@lsp.type.errorTag.zig',       { fg = c.fg })
hl(0, '@lsp.type.keyword.zig',        { fg = c.builtin })
hl(0, '@lsp.type.keywordLiteral.zig', { fg = c.number })          -- null, undefined, unreachable, true, false

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
hl(0, 'NvimTreeGitNew',          { fg = c.string })
hl(0, 'NvimTreeIndentMarker',    { fg = c.fg_dim })
