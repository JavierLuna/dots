local utils = require 'theme.utils'

local hiGroups = utils.merge_tables(
  require 'theme.higroups.bufferline',
  require 'theme.higroups.cmp',
  require 'theme.higroups.default',
  require 'theme.higroups.devicons',
  require 'theme.higroups.git',
  require 'theme.higroups.lsp',
  require 'theme.higroups.mason',
  require 'theme.higroups.nvimtree',
  require 'theme.higroups.syntax',
  require 'theme.higroups.telescope',
  require 'theme.higroups.treesitter'
)

for hl, col in pairs(hiGroups) do
  vim.api.nvim_set_hl(0, hl, col)
end

vim.cmd 'hi NonText guifg=bg'
vim.cmd 'hi SignColumn guibg=bg'
