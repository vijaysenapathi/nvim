local cmp = require("cmp")
local lspkind = require('lspkind')


cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = "path" }},
    {{ name = "cmdline" }}
  ),
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      if entry.source.name == "path" then
        return lspkind.cmp_format({
          mode = "symbol"
        })(entry, vim_item)
      else
        vim_item.menu = ""
        vim_item.kind = ""
        return vim_item
      end
    end
  },
  matching = {
    disallow_fuzzy_matching = false
  },
})
