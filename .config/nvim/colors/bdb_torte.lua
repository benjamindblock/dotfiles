-- ==============================================================================
-- bdb_torte: torte at night, a matching light variant for the day
-- ==============================================================================
--
-- The dark half is a faithful port of the torte remake that used to live in
-- colors/torte.vim (#1b1b1b background, loud X11-style colors). The light
-- half keeps the same *roles* -- keywords are the yellow family, strings the
-- blue family, types the green family, and so on -- so switching modes
-- doesn't change where your eyes go to find things. Only the shade changes.
--
-- Rules the light palette follows:
--
--   * Light backgrounds need *more* contrast than dark ones, not less. Every
--     syntax color sits at roughly 7:1 against the background or better, and
--     comments match the dark theme's ~5.5:1.
--   * No bright yellow text, ever. The "yellow" roles become a dark ochre;
--     bright yellow survives only as a *background* behind dark text (the
--     completion menu selection, TODO markers), where it reads fine.
--   * Colors are dark rather than bold. The bitmap font (Misc Fixed 6x13) has
--     one-pixel strokes and Ghostty has bold turned off, so darkness is the
--     only lever that makes thin text read heavier.
--   * The loud parts of torte stay loud: the solid blue status line, the
--     reverse-video search hits, the green cursor.
--
-- How switching works
-- -------------------
-- This file *reads* 'background' and never sets it. Neovim sets 'background'
-- itself from the terminal's background color: it asks Ghostty at startup
-- (OSC 11), and asks again whenever Ghostty announces a theme change (DEC
-- mode 2031). Whenever 'background' changes, Neovim re-runs
-- `:colorscheme bdb_torte`, which lands back here with the other palette.
-- So: macOS appearance flips -> Ghostty swaps theme -> every Neovim notices.
--
-- That is also why init.lua must not set 'background' explicitly: doing so
-- tells Neovim's auto-detection to stand down for the whole session.
--
-- The terminal palettes at the bottom mirror the Ghostty themes in
-- ~/.config/ghostty/themes/bdb_torte_{dark,light}; keep them in sync.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "bdb_torte"

-- ==============================================================================
-- Palettes
-- ==============================================================================
-- Both palettes have exactly the same keys. The highlight rules below only
-- ever refer to these names, never to hex values, so a group can't end up
-- styled in one mode and forgotten in the other.

local dark = {
  bg              = "#1b1b1b",
  fg              = "#ffffff",

  -- `ink` is the dark text color used *on top of* bright fills (yellow menu
  -- selection, reversed TODO, etc). In the dark theme it happens to equal
  -- the background, which is why torte could write those groups as reverse
  -- video against the background. The light theme can't, so it's split out.
  ink             = "#1b1b1b",

  -- Syntax roles.
  comment         = "#919191",
  string          = "#80a0ff",
  constant        = "#ffa0a0",
  identifier      = "#40ffff",
  statement       = "#ffff60",
  preproc         = "#ff80ff",
  type            = "#60ff60",
  special         = "#ffa500",
  title           = "#ff00ff",

  -- Gutter, cursor line, folds.
  cursorline      = "#333333",
  cursorlinenr    = "#ffff00",
  linenr          = "#7f7f7f",
  accent          = "#00ffff", -- sign/fold column, directories, special keys
  folded_fg       = "#00cdcd",
  folded_bg       = "#3a3a3a",
  colorcolumn     = "#8b0000",
  separator       = "#131313", -- deliberately almost invisible

  -- Selection and search.
  visual_fg       = "#1b1b1b",
  visual_bg       = "#a9a9a9",
  conceal_fg      = "#e5e5e5",
  conceal_bg      = "#a9a9a9",
  search          = "#ff0000",
  search_text     = "#1b1b1b",
  incsearch       = "#00cd00",
  matchparen      = "#008b8b",
  cursor          = "#00ff00",
  cursor_text     = "#1b1b1b",
  lcursor_fg      = "#1b1b1b",
  lcursor_bg      = "#e5e5e5",

  -- Whitespace markers and the `~` lines past end of buffer.
  nontext         = "#0000ff",

  -- Messages.
  error_bg        = "#ff0000",
  errormsg_bg     = "#cd0000",
  warning         = "#ff0000",
  more            = "#2e8b57",
  question        = "#00ff00",

  -- Spelling (both the text color and the undercurl).
  spell_bad       = "#ff0000",
  spell_cap       = "#5c5cff",
  spell_local     = "#ff00ff",
  spell_rare      = "#00ffff",

  -- Status line, splits, tabs.
  statusline_fg   = "#ffffff",
  statusline_bg   = "#0000ee",
  bar_fg          = "#1b1b1b", -- inactive status line, toolbar buttons
  bar_bg          = "#e5e5e5",
  tabline_fg      = "#ffffff",
  tabline_bg      = "#7f7f7f",

  -- Popup menu and floating windows (completion, LSP docs).
  pmenu_bg        = "#303030",
  float_bg        = "#2d2d2d",
  pmenu_thumb     = "#bebebe",
  highlight       = "#ffff00", -- bright fill behind `ink`: menu selection, TODO
  quickfix        = "#cdcd00",

  -- Diffs.
  diff_add_fg     = "#ffffff",
  diff_add_bg     = "#5f875f",
  diff_change_fg  = "#ffffff",
  diff_change_bg  = "#5f87af",
  diff_text_fg    = "#1b1b1b",
  diff_text_bg    = "#c6c6c6",
  diff_delete_fg  = "#ffffff",
  diff_delete_bg  = "#af5faf",

  -- :Zen sentence-pair manuscripts: the source sentence fades back, your own
  -- sentence is full strength.
  zen_source      = "#606060",
  zen_own         = "#ffffff",

  -- Colors for :terminal buffers, matching Ghostty's dark palette.
  terminal = {
    "#1b1b1b", "#fd9f9f", "#00cd00", "#fdfd5f", "#7FA0FF", "#cd00cd", "#00cdcd", "#e5e5e5",
    "#7f7f7f", "#ffa500", "#4EBA65", "#ffff00", "#8770ff", "#ff00ff", "#00ffff", "#ffffff",
  },
}

local light = {
  -- Neutral grey paper, pure black text. Grey rather than white takes the
  -- glare off a bright room; neutral rather than warm keeps it from looking
  -- like a sepia filter.
  bg              = "#eeeeee",
  fg              = "#000000",
  ink             = "#1b1b1b",

  -- Syntax roles. Same hue families as the dark palette, pushed dark enough
  -- that the 1px bitmap strokes stay solid. Contrast against #eeeeee is
  -- noted for each; the dark theme's equivalents run 7-16:1.
  comment         = "#5c5c5c", -- 5.8:1, the dark theme's comment is 5.5:1
  string          = "#1a3ab8", -- 7.7:1, periwinkle -> royal blue
  constant        = "#a30000", -- 7.1:1, salmon -> brick red
  identifier      = "#00545c", -- 7.4:1, cyan -> deep teal
  statement       = "#654800", -- 7.3:1, yellow -> dark ochre (never yellow text)
  -- PreProc drifts from pink to violet on purpose: a dark pink sits too
  -- close to the brick-red Constant, and in Ruby `def`/`attr_reader`
  -- (PreProc) constantly sit next to :symbols (Constant).
  preproc         = "#7400a8", -- 7.8:1, pink -> violet
  type            = "#0b5d00", -- 7.0:1, lime -> forest green
  special         = "#8f3600", -- 6.7:1, orange -> burnt orange
  title           = "#8a008a", -- 7.4:1, magenta (headings)

  -- Gutter, cursor line, folds. The cursor line sits the same step below
  -- the background as the dark theme's sits above it.
  cursorline      = "#d9d9d9",
  cursorlinenr    = "#654800",
  linenr          = "#666666",
  accent          = "#00545c",
  folded_fg       = "#00545c",
  folded_bg       = "#d6d6d6",
  colorcolumn     = "#8b0000",
  -- Ghostty's light theme sets minimum-contrast = 3, which repaints any
  -- text under 3:1 in black. A near-invisible separator like the dark
  -- theme's would get drawn solid black, so this is the faintest grey that
  -- survives it (3.1:1).
  separator       = "#868686",

  -- Selection and search. Visual is the same mid-grey block as at night:
  -- it already stands out against both backgrounds.
  visual_fg       = "#1b1b1b",
  visual_bg       = "#a9a9a9",
  conceal_fg      = "#1b1b1b",
  conceal_bg      = "#a9a9a9",
  search          = "#c80000", -- reversed: white text on a red block
  search_text     = "#ffffff",
  incsearch       = "#007000", -- reversed: white text on a green block
  matchparen      = "#5fd7d7", -- light cyan, so dark syntax text stays readable on it
  cursor          = "#00b000",
  cursor_text     = "#000000",
  lcursor_fg      = "#eeeeee",
  lcursor_bg      = "#1b1b1b",

  nontext         = "#0000ff",

  error_bg        = "#ff0000",
  errormsg_bg     = "#cd0000",
  warning         = "#b00000",
  more            = "#1d6640",
  question        = "#0b5d00",

  spell_bad       = "#b00000",
  spell_cap       = "#3030c0",
  spell_local     = "#7400a8",
  spell_rare      = "#00545c",

  -- The blue status line is already loud on white, so it stays as-is. The
  -- inactive bars become a grey that's visibly darker than the background.
  statusline_fg   = "#ffffff",
  statusline_bg   = "#0000ee",
  bar_fg          = "#000000",
  bar_bg          = "#bdbdbd",
  tabline_fg      = "#ffffff",
  tabline_bg      = "#7f7f7f",

  pmenu_bg        = "#d2d2d2",
  float_bg        = "#d6d6d6",
  pmenu_thumb     = "#8a8a8a",
  highlight       = "#ffff00",
  quickfix        = "#cdcd00",

  -- Diffs keep their hues (green add, blue change, purple delete) but as
  -- light fills under black text instead of dark fills under white text.
  diff_add_fg     = "#000000",
  diff_add_bg     = "#b9dfb9",
  diff_change_fg  = "#000000",
  diff_change_bg  = "#bfd3ec",
  diff_text_fg    = "#000000",
  diff_text_bg    = "#8fb3e0",
  diff_delete_fg  = "#000000",
  diff_delete_bg  = "#e3bde3",

  zen_source      = "#858585", -- just above minimum-contrast, see `separator`
  zen_own         = "#000000",

  -- Matches ~/.config/ghostty/themes/bdb_torte_light.
  terminal = {
    "#1b1b1b", "#b00000", "#0b6b00", "#6e5000", "#1a3ab8", "#8a008a", "#005f66", "#d0d0d0",
    "#5f5f5f", "#a14000", "#236b2f", "#7d5b00", "#4b30c8", "#a800a8", "#00707a", "#ffffff",
  },
}

local p = vim.o.background == "light" and light or dark

-- ==============================================================================
-- Highlight rules
-- ==============================================================================

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

-- Syntax. Treesitter highlighting is disabled in init.lua, so these classic
-- groups (and the language syntax files that link to them) are the whole
-- story. In Ruby: `if`/`end` are Statement, `def`/`class` are PreProc
-- (via Define), constants are Type, symbols are Constant, @ivars and method
-- names are Identifier, string delimiters and `#{}` are Special.
hi("Normal",     { fg = p.fg, bg = p.bg })
hi("Comment",    { fg = p.comment })
hi("String",     { fg = p.string })
hi("Constant",   { fg = p.constant })
hi("Identifier", { fg = p.identifier })
hi("Statement",  { fg = p.statement })
hi("PreProc",    { fg = p.preproc })
hi("Type",       { fg = p.type })
hi("Special",    { fg = p.special })
hi("Underlined", { fg = p.string, underline = true })
hi("Ignore",     { fg = p.bg, bg = p.bg })
hi("Error",      { fg = "#ffffff", bg = p.error_bg })
-- torte draws TODO as reverse video. That's fine on its own, but inside a
-- diff the Diff* group's text color replaces Todo's before the reverse is
-- applied, so on the light theme an added line's TODO became a solid black
-- block. Plain colors avoid that; the dark theme keeps torte's original.
if p == light then
  hi("Todo", { fg = p.ink, bg = p.highlight })
else
  hi("Todo", { fg = p.highlight, bg = p.ink, reverse = true })
end
hi("Title",      { fg = p.title, bold = true })

-- Markdown headings: one hue per level so the outline scans at a glance,
-- borrowed from the syntax roles so the palette stays coherent.
hi("markdownH1", { fg = p.statement, bold = true })
hi("markdownH2", { fg = p.identifier })
hi("markdownH3", { fg = p.type })
hi("markdownH4", { fg = p.special })
hi("markdownH5", { fg = p.preproc })
hi("markdownH6", { fg = p.string })
for level = 1, 6 do
  link("@markup.heading." .. level .. ".markdown", "markdownH" .. level)
  link("@markup.heading." .. level, "markdownH" .. level)
end

-- Gutter, cursor line, folds.
hi("LineNr",       { fg = p.linenr })
hi("CursorLine",   { bg = p.cursorline })
hi("CursorColumn", { bg = p.cursorline })
hi("CursorLineNr", { fg = p.cursorlinenr, bg = p.cursorline })
hi("SignColumn",   { fg = p.accent })
hi("FoldColumn",   { fg = p.accent })
hi("Folded",       { fg = p.folded_fg, bg = p.folded_bg })
hi("ColorColumn",  { fg = "#ffffff", bg = p.colorcolumn })
hi("NonText",      { fg = p.nontext, bold = true })
hi("EndOfBuffer",  { fg = p.nontext, bold = true })
hi("SpecialKey",   { fg = p.accent })
hi("Directory",    { fg = p.accent })
link("LineNrAbove",    "LineNr")
link("LineNrBelow",    "LineNr")
link("CursorLineFold", "CursorLine")
link("CursorLineSign", "CursorLine")

-- Selection, search, cursor.
hi("Visual",     { fg = p.visual_fg, bg = p.visual_bg, bold = true })
hi("VisualNOS",  { bg = p.bg, bold = true, underline = true })
hi("Conceal",    { fg = p.conceal_fg, bg = p.conceal_bg })
hi("Search",     { fg = p.search, bg = p.search_text, reverse = true })
hi("IncSearch",  { fg = p.incsearch, bg = p.search_text, reverse = true })
hi("MatchParen", { bg = p.matchparen })
hi("Cursor",     { fg = p.cursor_text, bg = p.cursor, bold = true })
hi("lCursor",    { fg = p.lcursor_fg, bg = p.lcursor_bg })
hi("CursorIM",   { bg = p.fg })
link("CurSearch", "Search")

-- Messages.
hi("ErrorMsg",   { fg = "#ffffff", bg = p.errormsg_bg })
hi("WarningMsg", { fg = p.warning })
hi("ModeMsg",    { bold = true })
hi("MoreMsg",    { fg = p.more, bold = true })
hi("Question",   { fg = p.question, bold = true })

-- Spelling.
hi("SpellBad",   { fg = p.spell_bad,   sp = p.spell_bad,   undercurl = true })
hi("SpellCap",   { fg = p.spell_cap,   sp = p.spell_cap,   undercurl = true })
hi("SpellLocal", { fg = p.spell_local, sp = p.spell_local, undercurl = true })
hi("SpellRare",  { fg = p.spell_rare,  sp = p.spell_rare,  undercurl = true })

-- Status line, splits, tabs.
hi("StatusLine",    { fg = p.statusline_fg, bg = p.statusline_bg, bold = true })
hi("StatusLineNC",  { fg = p.bar_fg, bg = p.bar_bg })
hi("VertSplit",     { fg = p.bar_fg, bg = p.bar_bg })
hi("WinSeparator",  { fg = p.separator })
hi("TabLine",       { fg = p.tabline_fg, bg = p.tabline_bg })
hi("TabLineFill",   { bg = p.bg, reverse = true })
hi("TabLineSel",    { fg = p.fg, bg = p.bg, bold = true })
hi("ToolbarLine",   { bg = p.bg })
hi("ToolbarButton", { fg = p.bar_fg, bg = p.bar_bg, bold = true })
link("StatusLineTerm",   "StatusLine")
link("StatusLineTermNC", "StatusLineNC")

-- Popup menu, floats, quickfix. CmpNormal/CmpDocNormal are the
-- winhighlight targets nvim-cmp is configured with in init.lua.
hi("Pmenu",        { fg = p.fg, bg = p.pmenu_bg })
hi("PmenuSbar",    {})
hi("PmenuSel",     { fg = p.ink, bg = p.highlight })
hi("PmenuThumb",   { bg = p.pmenu_thumb })
hi("WildMenu",     { fg = p.ink, bg = p.highlight })
hi("QuickFixLine", { fg = p.ink, bg = p.quickfix })
hi("NormalFloat",  { bg = p.float_bg })
hi("CmpNormal",    { bg = p.float_bg })
hi("CmpDocNormal", { bg = p.float_bg })
link("MessageWindow",     "Pmenu")
link("PopupNotification", "Todo")

-- Diffs.
hi("DiffAdd",    { fg = p.diff_add_fg,    bg = p.diff_add_bg })
hi("DiffChange", { fg = p.diff_change_fg, bg = p.diff_change_bg })
hi("DiffText",   { fg = p.diff_text_fg,   bg = p.diff_text_bg })
hi("DiffDelete", { fg = p.diff_delete_fg, bg = p.diff_delete_bg })

-- :Zen (see the Zen Mode section of init.lua).
hi("ZenSourceSentence", { fg = p.zen_source })
hi("ZenOwnSentence",    { fg = p.zen_own })

-- :terminal buffers.
link("Terminal", "Normal")
for i, color in ipairs(p.terminal) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

-- Intentionally omitted: Diagnostic*, LSP and @treesitter groups (other than
-- the markdown headings). `highlight clear` restores Neovim's built-in
-- defaults for those, and the built-ins already pick light or dark variants
-- from 'background'.
-- TODO: give Diagnostic* torte-flavored colors if the built-in ones clash.
