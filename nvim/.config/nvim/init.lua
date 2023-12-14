-- Install lazyvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key (important to go before lazyvim plugin definition)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup {
  'tpope/vim-fugitive',                    -- Git
  'tpope/vim-sleuth',                      -- Adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  {
    'neovim/nvim-lspconfig',               -- LSP Configuration & Plugins
    dependencies = {
      'williamboman/mason.nvim',           -- Installs LSP servers
      'williamboman/mason-lspconfig.nvim', -- Installs LSP server configurations
      'folke/neodev.nvim',                 -- Additional dev setup for LSPs
    },
  },
  {
    'vigoux/notifier.nvim',
    opts = {
      components = {
        "nvim",
        "lsp"
      },
      notify = {
        clear_time = 3000,
        min_level = vim.log.levels.INFO
      },
    }
  },
  {
    'lewis6991/gitsigns.nvim', -- Adds git signs to the side (gutter)
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
        untracked = { text = '│' }
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim', -- Status line
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        disabled_filetypes = { 'NvimTree' },
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  { 'folke/neoconf.nvim',          cmd = 'Neoconf' },
  {
    'alexghergh/nvim-tmux-navigation', -- Navigation with tmux
    lazy = false,
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<C-Left>',
          down = '<C-Down>',
          up = '<C-Up>',
          right = '<C-Right>',
        },
      }
    end,
  },
  { 'norcalli/nvim-colorizer.lua', lazy = false }, -- Hex to color
  { import = 'plugins.nvim-tree' },
  { import = 'plugins.telescope' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.nvim-cmp' },
  { import = 'plugins.conform' },
  { import = 'plugins.bufferline' },
  { import = 'plugins.comment' },
}

-- [[ SETTINGS ]]

vim.o.hlsearch = true                  -- Set highlight on search
vim.wo.number = true                   -- Make line numbers default
vim.o.mouse = 'a'                      -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'        -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true               -- Enable break indent
vim.o.undofile = true                  -- Save undo history
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true
vim.cmd('hi NonText guifg=bg')
vim.cmd('hi SignColumn guibg=bg')

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- [[ KEYMAPS ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set({ 'v' }, '>', '>gv', { silent = true, desc = "Indent line" })
vim.keymap.set({ 'v' }, '<', '<gv', { silent = true, desc = "De-indent line" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Resizing with arrows
vim.keymap.set('n', '<C-S-Up>', '<cmd> resize +2 <CR>', { desc = 'Resize window up', silent = true })
vim.keymap.set('n', '<C-S-Down>', '<cmd> resize -2 <CR>', { desc = 'Resize window down', silent = true })
vim.keymap.set('n', '<C-S-Left>', '<cmd> vertical resize -2 <CR>', { desc = 'Resize window left', silent = true })
vim.keymap.set('n', '<C-S-Right>', '<cmd> vertical resize +2 <CR>', { desc = 'Resize window right', silent = true })

-- Nvim Tree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'Toggle file tree', silent = true })

-- Some weird files that need special at
-- Autocommands
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Config",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "perl")
  end,
})

-- [[ LSP ]]
require 'plugins.lsp'

require 'theme.theme'
