-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
-- local autopairs = require('nvim-autopairs')
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')


--luasnip.config.setup({})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet= {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  matching = {
    disallow_fuzzy_matching = true
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
      select = true,
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
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  window = {
    -- completion = cmp.config.window.bordered({
    --   border = {"┌", "─" ,"┐","│", "┘", "─", "└", "│"},
    --   col_offset = -1,
    --   side_padding = 1
    -- }),

    documentation = cmp.config.window.bordered({
      border = {"┌", "─" ,"┐","│", "┘", "─", "└", "│"},
      -- border = {"┌", "┄" ,"┐","┊", "┘", "┄", "└", "┊"}
    }),
  },
  sources = {
    { name = 'nvim_lsp', group_index = 1},
    { name = 'luasnip', group_index = 1},
    { name = 'calc', group_index = 2},
    { name = 'buffer', group_index = 3},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = ({
        buffer = "[BFR]",
        nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
        calc = "[CALC]"
      })
    })
  },
  -- experimental = {
  --   ghost_text = true
  -- }
})


-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )

