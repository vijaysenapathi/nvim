local cmp = require('cmp')

-- local cmp_types = require('cmp.types')

cmp.setup.filetype("lua", {
  sources = {
    {
      name = 'nvim_lsp', group_index = 1,
    },
    { name = 'luasnip', group_index = 1},
    { name = 'buffer', group_index = 2},
    { name = 'calc', group_index = 3},
  },
  window = {
    completion = {scrollbar = true}
  }
})
