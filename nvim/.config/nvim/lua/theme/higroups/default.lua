local colors = require 'theme.colors'

return {
  MatchWord = {
    bg = colors.grey,
    fg = colors.white,
  },

  Pmenu = { bg = colors.one_bg },
  PmenuSbar = { bg = colors.one_bg },
  PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
  PmenuThumb = { bg = colors.grey },

  MatchParen = { link = 'MatchWord' },

  Comment = { fg = colors.grey_fg },

  CursorLineNr = { fg = colors.white },
  LineNr = { fg = colors.grey },

  -- floating windows
  FloatBorder = { fg = colors.grey },
  NormalFloat = { bg = colors.darker_black },

  NvimInternalError = { fg = colors.red },
  WinSeparator = { fg = colors.line },

  -- packer
  PackerPackageName = { fg = colors.red },
  PackerSuccess = { fg = colors.green },
  PackerStatusSuccess = { fg = colors.base08 },
  PackerStatusCommit = { fg = colors.blue },
  PackeProgress = { fg = colors.blue },
  PackerOutput = { fg = colors.red },
  PackerStatus = { fg = colors.blue },
  PackerHash = { fg = colors.blue },

  Normal = {
    fg = colors.base05,
    bg = colors.base00,
  },

  Bold = {
    bold = true,
  },

  Debug = {
    fg = colors.base08,
  },

  Directory = {
    fg = colors.base0D,
  },

  Error = {
    fg = colors.base00,
    bg = colors.base08,
  },

  ErrorMsg = {
    fg = colors.base08,
    bg = colors.base00,
  },

  Exception = {
    fg = colors.base08,
  },

  FoldColumn = {
    fg = colors.base0C,
    bg = colors.base01,
  },

  Folded = {
    fg = colors.base03,
    bg = colors.base01,
  },

  IncSearch = {
    fg = colors.base01,
    bg = colors.base09,
  },

  Italic = {
    italic = true,
  },

  Macro = {
    fg = colors.base08,
  },

  ModeMsg = {
    fg = colors.base0B,
  },

  MoreMsg = {
    fg = colors.base0B,
  },

  Question = {
    fg = colors.base0D,
  },

  Search = {
    fg = colors.base01,
    bg = colors.base0A,
  },

  Substitute = {
    fg = colors.base01,
    bg = colors.base0A,
    sp = 'none',
  },

  SpecialKey = {
    fg = colors.base03,
  },

  TooLong = {
    fg = colors.base08,
  },

  UnderLined = {
    fg = colors.base0B,
  },

  Visual = {
    bg = colors.base02,
  },

  VisualNOS = {
    fg = colors.base08,
  },

  WarningMsg = {
    fg = colors.base08,
  },

  WildMenu = {
    fg = colors.base08,
    bg = colors.base0A,
  },

  Title = {
    fg = colors.base0D,
    sp = 'none',
  },

  Conceal = {
    bg = 'NONE',
  },

  Cursor = {
    fg = colors.base00,
    bg = colors.base05,
  },

  NonText = {
    fg = colors.base03,
  },

  SignColumn = {
    fg = colors.base03,
    sp = 'NONE',
  },

  ColorColumn = {
    bg = colors.base01,
    sp = 'none',
  },

  CursorColumn = {
    bg = colors.base01,
    sp = 'none',
  },

  CursorLine = {
    bg = 'none',
    sp = 'none',
  },

  QuickFixLine = {
    bg = colors.base01,
    sp = 'none',
  },

  -- spell
  SpellBad = {
    undercurl = true,
    sp = colors.base08,
  },

  SpellLocal = {
    undercurl = true,
    sp = colors.base0C,
  },

  SpellCap = {
    undercurl = true,
    sp = colors.base0D,
  },

  SpellRare = {
    undercurl = true,
    sp = colors.base0E,
  },

  healthSuccess = {
    bg = colors.green,
    fg = colors.black,
  },
}
