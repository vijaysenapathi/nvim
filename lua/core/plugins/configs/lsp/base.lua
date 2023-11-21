require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", "clangd", "jedi_language_server", "groovyls", "cmake", "tsserver"
  }
})


vim.api.nvim_create_user_command(
  "Rename",
  function (_)
    vim.lsp.buf.rename()
  end,
  { nargs = 0 }
)
