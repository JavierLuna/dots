local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- Typescript, Javascript, HTML, CSS
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css", "typescript", "javascript", "typescriptreact", "json" },
  },
  b.diagnostics.prettierd,
  b.code_actions.prettierd,

  -- Python
  b.formatting.black,
  b.diagnostics.mypy,
  b.diagnostics.flake8,

  -- Lua
  b.formatting.stylua,

  -- Rust
  b.formatting.rustfmt,

  -- Swift
  b.formatting.swiftformat,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
