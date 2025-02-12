-- for managing lsp servers and dap clients
-- source: https://github.com/williamboman/mason.nvim


return {
  "williamboman/mason.nvim", name = "mason",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    require("mason").setup({})

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "clangd", "jedi_language_server", "cmake", "ts_ls", "bashls",
        "basedpyright" -- for python
      },
      automatic_installation = true
    })

    vim.api.nvim_create_user_command(
    "Rename",
    function (_)
      vim.lsp.buf.rename()
    end,
    { nargs = 0 }
    )

  end
}
