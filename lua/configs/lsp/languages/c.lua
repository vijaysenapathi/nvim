local set_keymaps = require("configs.lsp.keymaps")
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("lspconfig").clangd.setup({
  on_attach = set_keymaps,
  capabilities = capabilities
})

