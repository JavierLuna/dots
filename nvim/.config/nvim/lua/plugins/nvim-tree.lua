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
      git_ignored = false,
      custom = { 'node_modules', 'build' },
    },
    update_focused_file = {
      enable = true,
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
