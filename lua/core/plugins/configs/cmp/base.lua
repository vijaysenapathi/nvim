-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local autopairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')


luasnip.config.setup()
autopairs.setup({})

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
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  window = {
    completion = cmp.config.window.bordered({
      border = {"┌", "─" ,"┐","│", "┘", "─", "└", "│"},
    }),

    documentation = cmp.config.window.bordered({
      border = {"┏", "━" ,"┓","┃", "┛", "━", "┗", "┃"},
      max_height = 2
    }),

  },
  sources = {
    { name = 'nvim_lsp', group_index = 1},
    { name = 'luasnip', group_index = 1},
    { name = 'buffer', group_index = 1},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text'
    })
  }
})


cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local cmp_types = require('cmp.types')


cmp.setup.filetype("python", {
  sources = {
    {
      name = 'nvim_lsp', group_index = 1,
      entry_filter = function(entry, ctx)
        -- Trying to filter out stuff that starts with an underscore
        local entry_kind = cmp_types.lsp.CompletionItemKind[entry:get_kind()]
        local entry_word = entry:get_word()

        if (string.sub(entry_word, 1, 1) == "_") then
          return false
        end

        print(
          "DEBUG: " ..
          "kind: " .. vim.inspect() .. " " ..
          "word: " .. vim.inspect(entry:get_word()) .. " " ..
          -- "vim item: " .. vim.inspect(entry:get_vim_item()) .. " " ..
          "comp item: " .. vim.inspect(entry:get_completion_item())
        )
        return true
      end
    },
    { name = 'luasnip', group_index = 1},
    { name = 'buffer', group_index = 1},
  },
  window = {
    completion = {scrollbar = true}
  }
})
