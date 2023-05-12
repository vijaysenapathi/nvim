require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", "clangd", "jedi_language_server"
  }
})

