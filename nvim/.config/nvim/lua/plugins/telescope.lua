vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { desc = 'Find files', silent = true })
vim.keymap.set('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { desc = 'Live grep', silent = true })
vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { desc = 'Find buffers', silent = true })
vim.keymap.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>', { desc = 'Find in current buffer', silent = true })

return {
  {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder frontend
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
      },
    },
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          prompt_prefix = '   ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'insert',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          --    file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { 'node_modules' },
          --  generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { 'truncate' },
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' },
          -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            --n = { ["q"] = require("telescope.actions").close },
          },
        },

        extensions_list = { 'fzf' },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }
    end,
  },
}
