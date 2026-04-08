local palette = {
  bg = "{{colors.surface.default.hex}}",
  bg_alt = "{{colors.surface_container_low.default.hex}}",
  bg_float = "{{colors.surface_container.default.hex}}",
  fg = "{{colors.on_surface.default.hex}}",
  fg_muted = "{{colors.on_surface_variant.default.hex}}",
  accent = "{{colors.primary.default.hex}}",
  accent_soft = "{{colors.secondary.default.hex}}",
  green = "{{colors.secondary.default.hex}}",
  blue = "{{colors.secondary_fixed.default.hex}}",
  warning = "{{colors.tertiary.default.hex}}",
  error = "{{colors.error.default.hex}}",
  info = "{{colors.secondary.default.hex | harmonize "#5b8def"}}",
  hint = "{{colors.primary_fixed.default.hex}}",
  selection = "{{colors.primary_container.default.hex}}",
  cursor_line = "{{colors.surface_container_high.default.hex}}",
  line = "{{colors.outline_variant.default.hex}}",
  comment = "{{colors.outline.default.hex}}",
}

local groups = {
  Normal = { fg = palette.fg, bg = palette.bg },
  NormalFloat = { fg = palette.fg, bg = palette.bg_float },
  FloatBorder = { fg = palette.line, bg = palette.bg_float },
  CursorLine = { bg = palette.cursor_line },
  CursorLineNr = { fg = palette.accent_soft, bold = true },
  LineNr = { fg = palette.comment },
  SignColumn = { bg = palette.bg },
  VertSplit = { fg = palette.line },
  WinSeparator = { fg = palette.line },
  Visual = { bg = palette.selection },
  Search = { fg = palette.bg, bg = palette.accent },
  IncSearch = { fg = palette.bg, bg = palette.warning },
  MatchParen = { fg = palette.accent_soft, bold = true },
  Pmenu = { fg = palette.fg, bg = palette.bg_alt },
  PmenuSel = { fg = palette.bg, bg = palette.accent },
  PmenuSbar = { bg = palette.bg_alt },
  PmenuThumb = { bg = palette.line },
  StatusLine = { fg = palette.fg, bg = palette.bg_alt },
  StatusLineNC = { fg = palette.comment, bg = palette.bg_alt },
  TabLine = { fg = palette.comment, bg = palette.bg_alt },
  TabLineFill = { bg = palette.bg_alt },
  TabLineSel = { fg = palette.bg, bg = palette.accent_soft },
  ColorColumn = { bg = palette.bg_alt },
  Folded = { fg = palette.fg_muted, bg = palette.bg_alt },
  Directory = { fg = palette.blue },
  Title = { fg = palette.accent_soft, bold = true },
  Comment = { fg = palette.comment, italic = true },
  Constant = { fg = palette.warning },
  String = { fg = palette.green },
  Character = { fg = palette.green },
  Number = { fg = palette.warning },
  Boolean = { fg = palette.warning },
  Identifier = { fg = palette.fg },
  Function = { fg = palette.accent_soft },
  Statement = { fg = palette.accent },
  Conditional = { fg = palette.accent },
  Repeat = { fg = palette.accent },
  Keyword = { fg = palette.accent, italic = true },
  Operator = { fg = palette.fg_muted },
  PreProc = { fg = palette.blue },
  Type = { fg = palette.info },
  Special = { fg = palette.accent_soft },
  Underlined = { fg = palette.info, underline = true },
  Todo = { fg = palette.bg, bg = palette.warning, bold = true },
  Error = { fg = palette.error },
  ErrorMsg = { fg = palette.error, bold = true },
  WarningMsg = { fg = palette.warning, bold = true },
  DiagnosticError = { fg = palette.error },
  DiagnosticWarn = { fg = palette.warning },
  DiagnosticInfo = { fg = palette.info },
  DiagnosticHint = { fg = palette.hint },
  DiagnosticUnderlineError = { undercurl = true, sp = palette.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = palette.warning },
  DiagnosticUnderlineInfo = { undercurl = true, sp = palette.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = palette.hint },
  GitSignsAdd = { fg = palette.green },
  GitSignsChange = { fg = palette.accent },
  GitSignsDelete = { fg = palette.error },
}

local function apply()
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "neovim"
  vim.o.background = "dark"

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  vim.g.terminal_color_0 = palette.bg
  vim.g.terminal_color_1 = palette.error
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.warning
  vim.g.terminal_color_4 = palette.info
  vim.g.terminal_color_5 = palette.accent_soft
  vim.g.terminal_color_6 = palette.accent
  vim.g.terminal_color_7 = palette.fg
  vim.g.terminal_color_8 = palette.comment
  vim.g.terminal_color_9 = palette.error
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.warning
  vim.g.terminal_color_12 = palette.info
  vim.g.terminal_color_13 = palette.accent_soft
  vim.g.terminal_color_14 = palette.accent
  vim.g.terminal_color_15 = palette.fg
end

apply()

return {
  palette = palette,
  groups = groups,
  apply = apply,
}
