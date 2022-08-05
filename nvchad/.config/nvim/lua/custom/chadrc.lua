local M = {}

local userPlugins = require("custom.plugins")

M.ui = {
	theme = "gruvbox",
}

M.plugins = {
	user = userPlugins,
	override = {
		["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.treesitter").overrides,
		["kyazdani42/nvim-tree.lua"] = require("custom.plugins.nvim-tree").overrides,
		["williamboman/mason.nvim"] = require("custom.plugins.mason").overrides,
	},
	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},
	remove = {
		"NvChad/nvterm",
	},
}

return M
