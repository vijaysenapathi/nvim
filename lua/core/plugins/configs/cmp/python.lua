local cmp = require('cmp')

-- local cmp_types = require('cmp.types')

cmp.setup.filetype("python", {
  sources = {
    {
      name = 'nvim_lsp', group_index = 1,
      entry_filter = function(entry, _)
        -- Trying to filter out stuff that starts with an underscore
        -- local entry_kind = cmp_types.lsp.CompletionItemKind[entry:get_kind()]
        local entry_word = entry:get_word()

        return string.sub(entry_word, 1, 1) ~= "_"
      end
    },
    { name = 'luasnip', group_index = 1},
    { name = 'buffer', group_index = 2},
    { name = 'calc', group_index = 3},
  },
  window = {
    completion = {scrollbar = true}
  }
})
