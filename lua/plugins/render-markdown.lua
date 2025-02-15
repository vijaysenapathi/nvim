-- better rendering of markdown within neovim
-- source: https://github.com/MeanderingProgrammer/render-markdown.nvim


return {
  "MeanderingProgrammer/render-markdown.nvim", name = "render-markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  enable = false,
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {
    render_modes = { "n", "v" },
    heading = {
      sign = false,
      position = "inline",
      icons = { " 󰉫 ", " 󰉬 ", " 󰉭 ", " 󰉮 ", " 󰉯 ", " 󰉰 " }
    },
    code = {
      style = "full",
      sign = false,
      position = "left",
      language_name = true,
      width = "full",
      language_pad = 0,
      left_margin = 0
    },
    bullet = {
      icons = { ' ', ' ', '◆ ', '◇ ' },
    },
    checkbox = {
      unchecked = { icon = " " },
      checked = { icon = " " }
    },
    latex = { enabled = false },
    on = {
      attach = function (_)
        print("attached mark")
        vim.cmd("TSBufEnable highlight")
      end,
      render = function (_) print("rendered mark") end
    }
  },
}
