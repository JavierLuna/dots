local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
	"html",
	"cssls",
	"dockerls",
	"jsonls",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"vimls",
}

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "swift", "objective-c", "objective-cpp" },
})

vim.diagnostic.config({
	virtual_text = false,
})
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
