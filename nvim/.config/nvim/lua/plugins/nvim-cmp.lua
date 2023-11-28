local function getOpts()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'

  require('luasnip.loaders.from_vscode').lazy_load()
  luasnip.config.setup {}

  local function border(hl_name)
    return {
      { '╭', hl_name },
      { '─', hl_name },
      { '╮', hl_name },
      { '│', hl_name },
      { '╯', hl_name },
      { '─', hl_name },
      { '╰', hl_name },
      { '│', hl_name },
    }
  end

  local options = {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = 'menu,menuone',
    },

    window = {
      -- completion = {
      --   side_padding = 1,
      --   winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      --   scrollbar = false,
      -- },
      documentation = {
        border = border 'CmpDocBorder',
        winhighlight = 'Normal:CmpDoc',
      },
    },

    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.expand_or_locally_jumpable(-1) then
          luasnip.expand_or_jump(-1)
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'nvim_lua' },
      { name = 'path' },
    },
  }

  return options
end

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp', -- Adds LSP completion capabilities
    'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
    {
      'windwp/nvim-autopairs', -- autopairing of (){}[] etc
      opts = {
        fast_wrap = {},
        disable_filetype = { 'TelescopePrompt', 'vim' },
      },
      config = function(_, opts)
        require('nvim-autopairs').setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end,
    },

    -- cmp sources plugins
    {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },
  opts = getOpts,
  config = function(_, opts)
    require('cmp').setup(opts)
  end,
}
