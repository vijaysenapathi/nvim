require("nvim-treesitter.configs").setup({
  -- list of parser names
  ensure_installed = { "c", "cpp", "cmake", "lua", "python", "rust", "vim" },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})
--[[
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
]]
