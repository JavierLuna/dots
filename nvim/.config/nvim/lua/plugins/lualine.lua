local colors = require 'theme.colors'

local theme = {
  normal = {
    a = { bg = colors.nord_blue, fg = colors.black, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.white },
    c = { bg = colors.black, fg = colors.gray },
  },
  insert = {
    a = { bg = colors.dark_purple, fg = colors.black, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.white },
    c = { bg = colors.grey, fg = colors.white },
  },
  visual = {
    a = { bg = colors.cyan, fg = colors.black, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.white },
    c = { bg = colors.black, fg = colors.black },
  },
  replace = {
    a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.white },
    c = { bg = colors.black, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.white },
    c = { bg = colors.black, fg = colors.black },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.one_bg, fg = colors.gray },
    c = { bg = colors.black, fg = colors.gray },
  },
}

return {
  'nvim-lualine/lualine.nvim', -- Status line
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = theme,
        globalstatus = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      extensions = { 'nvim-tree', 'fugitive', 'fzf', 'lazy', 'mason' },
    }
  end,
}
