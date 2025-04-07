return {
  'nvim-lualine/lualine.nvim', -- Status line
  opts = function()
    return {
      options = {
        icons_enabled = true,
        -- theme = theme,
        globalstatus = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      extensions = { 'nvim-tree', 'fugitive', 'fzf', 'lazy', 'mason' },
    }
  end,
}
