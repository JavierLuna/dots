return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'onsails/lspkind.nvim',
    'nvim-tree/nvim-web-devicons',
    'xzbdmw/colorful-menu.nvim'
  },

  --@module 'blink.cmp'
  --@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',

      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'buffer', 'snippets' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        }
      }
    },
    fuzzy = { implementation = 'lua' },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_insert = false,
      }
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      accept = { auto_brackets = { enabled = true }, },
      menu = {
        scrollbar = false,
        draw = {
          treesitter = { "lsp" },
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            kind_icon = {
              text = function(ctx)
                local lspkind = require("lspkind")
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          }
        }
      }
    }
  }
}
