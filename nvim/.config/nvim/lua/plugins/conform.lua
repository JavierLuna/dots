vim.keymap.set('n', '<leader>fm', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = 'Format buffer' })

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format' },
      javascript = { { 'eslint_d', 'eslint' }, { 'prettierd', 'prettier' } },
      typescript = { { 'eslint_d', 'eslint' }, { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
      rust = { 'rustfmt' },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match '/node_modules/' then
        return
      end
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
  },
}
