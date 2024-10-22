require("mason").setup()
require("mason-lspconfig").setup({
  -- TODO: Figure out typescript 
  ensure_installed = {
    "lua_ls", "clangd", "jedi_language_server", "cmake"
  }
})


vim.api.nvim_create_user_command(
  "Rename",
  function (_)
    vim.lsp.buf.rename()
  end,
  { nargs = 0 }
)
