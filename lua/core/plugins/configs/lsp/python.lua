local set_keymaps = require("core.plugins.configs.lsp.keymaps")
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- require("lspconfig").pylsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 120
--         }
--       }
--     }
--   }
-- })


require("lspconfig").jedi_language_server.setup({
  on_attach = set_keymaps,
  capabilities = capabilities
})
