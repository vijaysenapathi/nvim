-- adding auto complete capabilities
-- source: https://github.com/hrsh7th/nvim-cmp


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


return {
  "hrsh7th/nvim-cmp",
  -- dir = { "/Users/neo/Projects/Personal/Repositories/nvim-cmp" },
  name = "nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- for lsp completions
    "hrsh7th/cmp-buffer", -- for text in buffer completions
    "hrsh7th/cmp-path", -- for path completions
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "folke/lazydev.nvim", -- f
    { "onsails/lspkind.nvim", name = "lspkind" },
    { 'j-hui/fidget.nvim', config = true, enabled = false },  -- Useful status updates for LSP.
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      sources = {
        { name = 'lazydev', group_index = 1},
        { name = 'nvim_lsp', group_index = 1},
        { name = 'luasnip', group_index = 1},
        { name = 'buffer', group_index = 2},
      },
      snippet= {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = {
          border = { '', '', '', '', '', '', '', '' },
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
          scrollbar = true,
        },
        documentation = {
          border = { '', '', '', ' ', '', '', '', ' ' },
          winhighlight = 'FloatBorder:NormalFloat',
        }
      },
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        filtering_context_budget = 3,
        confirm_resolve_timeout = 80,
        async_budget = 1,
        -- default 200
        max_view_entries = 200,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete {},
        --['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

      },
      -- TODO: fix the below missing required fields
      formatting = {
        fields = { 'kind', 'abbr' },
        -- whether to show ~ for expanding options
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            return vim_item
          end
        })

      },
      matching = {
        disallow_fuzzy_matching = true,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = true,
        disallow_partial_matching = true,
        disallow_prefix_unmatching = false,
        disallow_symbol_nonprefix_matching = false,
      }
    })


  end
}
