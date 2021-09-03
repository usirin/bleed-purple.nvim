local lush = require("lush")
local hsl = lush.hsl

local purples = {
  ["twitch-purple-1"] = hsl(264, 80, 2),
  ["twitch-purple-2"] = hsl(264, 80, 6),
  ["twitch-purple-3"] = hsl(264, 80, 10),
  ["twitch-purple-4"] = hsl(264, 80, 17),
  ["twitch-purple-5"] = hsl(264, 80, 24),
  ["twitch-purple-6"] = hsl(264, 80, 32),
  ["twitch-purple-7"] = hsl(264, 80, 43),
  ["twitch-purple-8"] = hsl(264, 80, 54),
  ["twitch-purple-9"] = hsl(264, 100, 64),
  ["twitch-purple-10"] = hsl(264, 100, 72),
  ["twitch-purple-11"] = hsl(264, 100, 79),
  ["twitch-purple-12"] = hsl(264, 100, 85),
  ["twitch-purple-13"] = hsl(264, 100, 91),
  ["twitch-purple-14"] = hsl(264, 100, 95),
  ["twitch-purple-15"] = hsl(264, 100, 99)
}

local greys = {
  ["hinted-grey-1"] = hsl(240, 7, 6),
  ["hinted-grey-2"] = hsl(240, 7, 10),
  ["hinted-grey-3"] = hsl(240, 7, 13),
  ["hinted-grey-4"] = hsl(240, 7, 16),
  ["hinted-grey-5"] = hsl(240, 7, 21),
  ["hinted-grey-6"] = hsl(240, 7, 25),
  ["hinted-grey-7"] = hsl(240, 7, 35),
  ["hinted-grey-8"] = hsl(240, 7, 55),
  ["hinted-grey-9"] = hsl(240, 7, 70),
  ["hinted-grey-10"] = hsl(240, 7, 80),
  ["hinted-grey-11"] = hsl(240, 7, 84),
  ["hinted-grey-12"] = hsl(240, 7, 88),
  ["hinted-grey-13"] = hsl(240, 7, 91),
  ["hinted-grey-14"] = hsl(240, 7, 94),
  ["hinted-grey-15"] = hsl(240, 7, 97)
}

local colors = {
  white = hsl(0, 0, 100),
  black = hsl(0, 0, 0),
  red = hsl(1, 83, 50),
  red_darker = hsl(1, 83, 40),
  orange = hsl(40, 100, 74),
  twitch_purple = purples["twitch-purple-9"],
  green = hsl(156, 100, 48),
  green_darker = hsl(172, 100, 34),
  blue = hsl(220, 100, 56)
}

local dark_theme = {
  bg_body = colors.black,
  bg_base = greys["hinted-grey-2"],
  bg_alt = greys["hinted-grey-3"],
  bg_alt2 = greys["hinted-grey-4"],
  bg_accent = purples["twitch-purple-8"],
  bg_accent_alt = purples["twitch-purple-7"],
  bg_accent_alt2 = purples["twitch-purple-6"],

  text_base = greys["hinted-grey-14"],
  text_alt = greys["hinted-grey-11"],
  text_alt2 = greys["hinted-grey-8"],
  text_alt3 = greys["hinted-grey-6"],
  text_link = purples["twitch-purple-10"],

  alert = colors.red,
  error = colors.red_darker,
  success = colors.green,
  warn = colors.orange,
  info = colors.blue
}

local theme = lush(function()
  return {

    Normal {fg = dark_theme.text_alt2, bg = dark_theme.bg_base},
    BgBody {fg = dark_theme.text_base, bg = dark_theme.bg_body},
    AlertText {fg = dark_theme.alert},
    WarnText {fg = dark_theme.warn},
    SuccessText {fg = dark_theme.success},
    InfoText {fg = dark_theme.info},
    BrandText {fg = dark_theme.text_link},
    TextAlt {fg = dark_theme.text_alt},
    TextAlt2 {fg = dark_theme.text_alt2},
    TextAlt3 {fg = dark_theme.text_alt3},


    Comment {fg = dark_theme.text_alt3},
    Cursor {bg = dark_theme.bg_accent},

    CursorLine {bg = dark_theme.bg_alt},
    ColorColumn {CursorLine},

    Conceal {TextAlt3},
    NonText {TextAlt3},
    TODO { BrandText },

    LineNr {TextAlt3},
    CursorLineNr {BrandText},

    SignColumn {},
    Search {gui = "underline"},
    IncSearch { Search }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

    MatchParen {bg = dark_theme.bg_accent_alt2}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    Visual {bg = dark_theme.bg_accent, fg = dark_theme.text_base},

    Title {BrandText, gui = "bold"}, -- titles for output from ":set all", ":autocmd" etc.
    TabLine {bg = dark_theme.bg_base}, -- tab pages line, not active tab page label
    TabLineFill {bg = dark_theme.bg_base}, -- tab pages line, where there are no labels
    TabLineSel {TextAlt, bg = dark_theme.bg_alt2}, -- tab pages line, active tab page label

    Pmenu        {TextAlt, bg = dark_theme.bg_alt }, -- Popup menu: normal item.
    PmenuSel     {fg = dark_theme.text_base, bg = dark_theme.bg_accent }, -- Popup menu: selected item.

    PmenuSbar    { }, -- Popup menu: scrollbar.

    DiffAdd {fg = dark_theme.bg_base, bg = dark_theme.success},
    DiffChange {fg = dark_theme.warn, gui = "underline"},
    DiffDelete {fg = dark_theme.bg_base, bg = dark_theme.alert},
    DiffText {fg = dark_theme.bg_base, bg = dark_theme.warn},

    ErrorMsg {AlertText},
    VertSplit {BrandText},

    GitSignsAdd {SuccessText},
    GitSignsChange {WarnText},
    GitSignsDelete {AlertText},
    GitSignsChangeDelete {AlertText},

    LspDiagnosticsError               { AlertText }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsErrorSign           { AlertText }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsErrorFloating       { AlertText }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsWarning             { WarnText }, -- used for "Warning" diagnostic virtual text
    LspDiagnosticsWarningSign         { WarnText }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsWarningFloating     { WarnText }, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsInformation         { InfoText }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsInformationSign     { InfoText }, -- used for "Information" signs in sign column
    LspDiagnosticsInformationFloating { InfoText }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsHint                { SuccessText }, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsHintSign            { SuccessText }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsHintFloating        { SuccessText }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspReferenceText                  { TabLineSel }, -- used for highlighting "text" references
    LspReferenceRead                  { TabLineSel }, -- used for highlighting "read" references
    LspReferenceWrite                 { TabLineSel }, -- used for highlighting "write" references


    CocHighlightText {TabLineSel},

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { TextAlt, gui = "bold"}, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier     { fg = dark_theme.text_alt }, -- (preferred) any variable name
    TSFunction       { BrandText }, -- function name (also: methods for classes)
    TSMethod       { TSFunction }, -- function name (also: methods for classes)
    -- goFunctionCall { Function },

    Statement      { TextAlt2, gui = "bold" }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { Statement }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { SuccessText, gui = "bold"}, -- (preferred) int, long, char, etc.
    StorageClass   { Type }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { SuccessText }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { AlertText }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX



    StartifyNumber {TextAlt2},
    StartifyBracket {TextAlt},
    StartifySection {Title},
    StartifyPath {TextAlt2},
    StartifySlash {TextAlt},
    StartifyFile {StorageClass},

    Directory {SuccessText},

    NvimTreeRootFolder {BrandText},
    NvimTreeFolderIcon {fg = SuccessText.fg.darken(50)},
    NvimTreeFolderName {SuccessText},
--     NvimTreeIndentMarker {fg = gray},
--     NvimTreeSymlink {fg = cyan, gui = underline_strings},
--     NvimTreeEmptyFolderName {fg = comment_gray},
--     NvimTreeExecFile {fg = green, gui = bold_underline_strings},
--     NvimTreeSpecialFile {Special},
--     NvimTreeImageFile {},
--     NvimTreeMarkdownFile {fg = red},
--
--     NvimTreeLicenseIcon {fg = yellow},
--     NvimTreeYamlIcon {fg = yellow},
--     NvimTreeTomlIcon {fg = yellow},
--     NvimTreeGitignoreIcon {fg = red},
--     NvimTreeJsonIcon {fg = green},
--
--     NvimTreeLuaIcon {fg = blue},
--     NvimTreePythonIcon {fg = yellow},
--     NvimTreeShellIcon {fg = fg1},
--     NvimTreeCIcon {fg = blue},
--     NvimTreeReactIcon {fg = blue},
--     NvimTreeHtmlIcon {fg = red},
--     NvimTreeRustIcon {fg = fg1},
--     NvimTreeTypescriptIcon {fg = blue},
--     NvimTreeVimIcon {fg = green},
--     NvimTreeJavascriptIcon {fg = yellow},
--
--     NvimTreeGitDirty {fg = red},
--     NvimTreeGitStaged {fg = yellow},
--     NvimTreeGitMerge {fg = cyan},
--     NvimTreeGitRenamed {fg = yellow},
--     NvimTreeGitNew {fg = purple},



    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    TSConstBuiltin       { Constant };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { fg = dark_theme.text_base };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    TSOperator           { TextAlt };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    TSPunctDelimiter     { TextAlt };    -- For delimiters ie: `.`
    TSPunctBracket       { TextAlt };    -- For brackets and parens.
    TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    -- TSString             { };    -- For strings.
    -- TSStringRegex        { };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    -- TSTitle              { };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    -- TSURI                { };    -- Any URI like a link or email.

  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
