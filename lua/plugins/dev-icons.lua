-- fancy icons for neovim
-- source: https://github.com/nvim-tree/nvim-web-devicons


return {
  "nvim-tree/nvim-web-devicons", name = "web-devicons",
  enabled = vim.g.nerd_font_enabled,
  config = function ()
    require("nvim-web-devicons").setup({
      color_icons = true
    })
    vim.opts.listchars = { tab = ' ', trail = '󱁐', nbsp = '󰍴' }
  end
}

