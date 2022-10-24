local M = {}

M.overrides = {
	git = {
		enable = true,
	},

  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  }
}

return M
