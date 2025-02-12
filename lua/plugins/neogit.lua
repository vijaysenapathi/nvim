-- for managing git from within neovim
-- source: https://github.com/NeogitOrg/neogit


return {
  "NeogitOrg/neogit", name = "neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  opts = {
  }
}
