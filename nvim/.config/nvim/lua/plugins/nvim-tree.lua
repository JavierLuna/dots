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
    filters = {
      dotfiles = true,
      custom = { 'node_modules' },
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
  },
}
