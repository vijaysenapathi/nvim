require("neodev").setup({})

local set_keymaps = require("core.plugins.configs.lsp.keymaps")
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("lspconfig").lua_ls.setup({
  on_attach = set_keymaps,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      diagnostics = {
        globals = { 'vim' , 'vim.treesitter', 'RunCommand'}
      },
      runtime = {
        version = "Lua 5.4.5",
        path = {
          "~/.config/nvim/lua/?/?.lua"
          -- "script/?.lua",
          -- "script/?/init.lua",
          -- "test/?.lua",
          -- "test/?/init.lua",
          -- "script/meta/?.lua"
        },
        pathStrict = true
      },
    }
  }
})
