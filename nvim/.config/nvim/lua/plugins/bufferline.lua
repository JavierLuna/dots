vim.keymap.set('n', '<Tab>', '<cmd> BufferLineCycleNext <CR>', { silent = true, desc = 'Next tab' })
vim.keymap.set('n', '<S-Tab>', '<cmd> BufferLineCycleNext <CR>', { silent = true, desc = 'Next tab' })

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        hover = {
          enabled = true,
          delay = 150,
          reveal = { 'close' },
        },
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        move_wraps_at_ends = true,
        offsets = {
          {
            filetype = "NvimTree",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        },
      },
    }
  end,
}
