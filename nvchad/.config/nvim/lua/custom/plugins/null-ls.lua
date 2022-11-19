local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {

	-- Typescript, Javascript, HTML, CSS
	b.formatting.prettierd.with({ filetypes = { "html", "markdown", "css", "typescript", "javascript", "json" } }),
	b.diagnostics.eslint_d,
	b.code_actions.eslint_d,

	-- Python
	b.formatting.black,
	b.diagnostics.mypy,
	b.diagnostics.flake8,

	-- Lua
	b.formatting.stylua,

	-- Swift
	b.formatting.swiftformat,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

local M = {}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format on save
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end

return M
