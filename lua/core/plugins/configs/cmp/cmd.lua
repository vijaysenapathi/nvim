local cmp = require("cmp")

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = "path" }},
    {{ name = "cmdline" }}
  ),
  matching = {
    disallow_fuzzy_matching = false
  },
})
