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

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  local empty = require('lualine.component'):extend()
  function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
  end

  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.black } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg '/'
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

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
      extensions = { 'nvim-tree' },
    }
  end,
}
