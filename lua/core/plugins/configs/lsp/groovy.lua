local set_keymaps = require("core.plugins.configs.lsp.keymaps")
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("lspconfig").groovyls.setup({
  on_attach = set_keymaps,
  capabilities = capabilities
})
