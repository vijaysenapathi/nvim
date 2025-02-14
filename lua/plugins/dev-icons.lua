-- fancy icons for neovim
-- source: https://github.com/nvim-tree/nvim-web-devicons


return {
  "nvim-tree/nvim-web-devicons", name = "web-devicons",
  enabled = vim.g.nerd_font_enabled,
  config = true
  -- config = function ()
  --   require("nvim-web-devicons").setup {}
  --   vim.opts.listchars = { tab = ' ', trail = '󱁐', nbsp = '󰍴' }
  -- end
}

