return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function(_, opts)
    require("Comment").setup(opts)
    vim.keymap.set({ 'n' }, '<leader>/', function() require("Comment.api").toggle.linewise.current() end,
      { silent = true, desc = "Comment/Uncomment line" })
    vim.keymap.set({ 'v' }, '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { silent = true, desc = "Comment/Uncomment lines" })
  end
}
