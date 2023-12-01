return {
  'nvim-tree/nvim-tree.lua', -- File tree
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  opts = {
    git = {
      enable = true,
    },
    view = {
      number = false,
      relativenumber = false,
    },
    filters = {
      dotfiles = true,
      custom = { 'node_modules' },
    },
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
  },
}
