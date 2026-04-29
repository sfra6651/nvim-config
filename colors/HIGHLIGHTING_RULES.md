# Custom Colorscheme Highlighting Rules

This file is the spec for **every colorscheme in this directory whose name
starts with `my_`**. All `my_*` schemes share the same set of highlight rules
and palette keys — the only thing that varies between them is the hex values
each key is bound to. Any new `my_*` scheme should follow the rules below; any
adjustment to the rules should be applied consistently to all `my_*` schemes.

## Design intent

- **Minimal**: user-defined types, variables, members, parameters, and most
  keywords stay default `fg`. The eye should land on a small number of
  distinct roles, not on syntactic noise.
- **Role-based, not token-based**: colors map to semantic roles (function,
  built-in, control flow, string, comment, operator, macro, directive), not to
  individual tokens.
- **Treesitter + LSP coverage**: each role is wired through the legacy vim
  groups, the `@` treesitter captures, and the `@lsp.type.*` semantic tokens so
  clangd / rust-analyzer / etc. don't override the look.

## Required palette keys

Every `my_*` scheme must define the following keys in its `c` palette table.
The role each key plays is fixed; only the hex value varies.

## Roles and the groups they cover

| Role            | Vim groups                                          | Treesitter captures                                                                                                  | LSP semantic tokens                                              |
| --------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `fg` (default)  | `Identifier`, `Keyword`, `Type`, `Structure`, `Number`, `Float`, `Tag`, `Delimiter` | `@variable`, `@variable.builtin`, `@constant`, `@type`, `@type.definition`, `@constructor`, `@field`, `@property`, `@variable.member`, `@parameter`, `@attribute`, `@namespace`, `@number`, `@string.escape`, `@punctuation.bracket`, `@punctuation`, `@tag`, `@tag.attribute` | `@lsp.type.type/class/struct/enum/interface/typeParameter/property/member/field/parameter/variable/namespace/enumMember/macro?/keyword` |
| `func`          | `Function`                                          | `@function`, `@function.call`, `@function.builtin`, `@method`, `@method.call`                                        | `@lsp.type.function`, `@lsp.type.method`, `@lsp.typemod.function.defaultLibrary` |
| `builtin`       | `Statement`, `Conditional`, `Repeat`, `Label`, `Exception`, `Boolean`, `Constant`, `StorageClass`, `Typedef` | `@keyword.return`, `@keyword.exception`, `@keyword.conditional`, `@keyword.repeat`, `@keyword.modifier`, `@keyword.storage`, `@conditional`, `@repeat`, `@exception`, `@label`, `@constant.builtin`, `@type.builtin`, `@type.qualifier` | `@lsp.type.modifier`, `@lsp.typemod.variable.defaultLibrary` |
| `string`        | `String`, `Character`                               | `@string`                                                                                                            | `@lsp.type.string` (linked to `String`)                          |
| `comment`       | `Comment`, `SpecialComment`                         | `@comment`                                                                                                           | `@lsp.type.comment` (linked to `Comment`)                        |
| `operator`      | `Operator`                                          | `@operator`, `@keyword.operator`, `@punctuation.delimiter`                                                           | `@lsp.type.operator`                                             |
| `macro`         | `Macro`, `Define`                                   | `@function.macro`, `@constant.macro`, `@define`                                                                      | `@lsp.type.macro`                                                |
| `preproc`       | `PreProc`, `Include`, `PreCondit`                   | `@preproc`, `@include`, `@keyword.import`, `@keyword.directive`                                                      | —                                                                |
| `accent_bright` | `Title`, `Search`, `IncSearch`, `CurSearch`, `MatchParen`, `Special`, `SpecialChar`, `Question`, `CursorLineNr`, `TabLineSel` | `@punctuation.special`, `@markup.heading`, `@markup.link`        | —                                                                |
| `error`         | `Error`, `ErrorMsg`, `DiagnosticError`              | —                                                                                                                    | —                                                                |
| `warning`       | `WarningMsg`, `Todo`, `Debug`, `DiagnosticWarn`     | —                                                                                                                    | —                                                                |
| `info`          | `DiagnosticInfo`                                    | —                                                                                                                    | —                                                                |
| `hint`          | `DiagnosticHint`                                    | —                                                                                                                    | —                                                                |
| `fg_dim`        | `LineNr`, `VertSplit`, `WinSeparator`, `NonText`, `SpecialKey`, `Whitespace`, `Conceal`, `FoldColumn`, `Folded`, `Ignore`, `StatusLineNc` | `@tag.delimiter`                                                                                                    | —                                                                |
| `bg`            | `Normal`, `SignColumn`                              | —                                                                                                                    | —                                                                |
| `bg_alt`        | `NormalFloat`, `FloatBorder`, `StatusLine`, `Pmenu`, `TabLine`, `Folded`, `ColorColumn` | —                                                                                                                    | —                                                                |
| `bg_visual`     | `Visual`, `QuickFixLine`, `TelescopeSelection`      | —                                                                                                                    | —                                                                |
| `bg_cursor`     | `CursorLine`                                        | —                                                                                                                    | —                                                                |

## Notable choices

- **Numbers stay default fg.** They are literals, not built-ins; coloring them
  draws the eye away from the surrounding logic.
- **Booleans are `builtin`.** `true` / `false` / `nullptr` / `NULL` are
  language built-in constants, distinct from user constants.
- **`@variable.builtin` (`this`, `self`) is `fg`**, not `builtin` — keeps
  member access visually flat.
- **User-defined types are `fg`.** Only `@type.builtin` (`int`, `void`, `bool`,
  `auto`, `char`) gets the `builtin` color. This keeps headers full of custom
  type names from looking noisy.
- **`@punctuation.bracket` stays `fg`.** Coloring `()` / `{}` / `[]` would be
  too much; only `<>` (which clangd/treesitter tag as `@operator`) and `::`
  (`@punctuation.delimiter`) get the operator color.
- **`Define` / `Macro` use the macro color, not preproc.** A `#define FOO 1`
  line shows `#define` in the directive color and `FOO` in the macro color, so
  the macro identifier is what stands out at the call site.
- **`@keyword.import` is `preproc`.** Mostly for languages where imports are
  declarative top-of-file directives that read like preprocessor lines.
- **Comments and strings always italic / non-italic respectively** — the only
  two roles that lean on font style as well as color.

## Adding a new `my_*` scheme

1. Create `colors/my_<name>.lua`.
2. Copy the structure of an existing `my_*` scheme (`hi clear`, the `c`
   palette table, all the `hl(...)` calls). Set `vim.g.colors_name` to match
   the file name.
3. Bind every key listed in the "Roles and the groups they cover" table to
   a hex value chosen for the new scheme. Don't omit any key — leaving one
   unset would crash `nvim_set_hl`.
4. Add the scheme name to the lazy fallback list in `lua/config/init.lua`
   (`install.colorscheme`) if it should be available at bootstrap.

## Adding a new role across all `my_*` schemes

1. Add a key to the `c` palette in **every** `my_*` scheme file (currently
   `my_matrix_soft.lua` and `my_one_dark_minimal.lua`).
2. Wire the role through the three layers:
   - legacy vim groups (`hl(0, 'GroupName', ...)`)
   - treesitter captures (`hl(0, '@capture.name', ...)`)
   - LSP semantic tokens (`hl(0, '@lsp.type.kind', ...)`) if applicable
3. Update the "Roles and the groups they cover" table above.
