-- makes help screens better
-- source: https://github.com/OXY2DEV/helpview.nvim


return {
  "OXY2DEV/helpview.nvim", name = "helpview", lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    preview = {
        icon_provider = "devicons"
    }
  }
}
