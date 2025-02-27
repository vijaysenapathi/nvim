-- better rendering of markdown within neovim
-- source: https://github.com/MeanderingProgrammer/render-markdown.nvim


-- currently will only enable render markdown in nerd fonts are enabled
if vim.g.nerd_font_enabled then
  return {
    "MeanderingProgrammer/render-markdown.nvim", enabled = true,
    name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-tree/nvim-web-devicons", optional = true }
    },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
      render_modes = { "n", "v" },
      heading = {
        sign = false,
        position = "inline",
        icons = { '', '', '', '', '', '' },
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
          vim.cmd("TSBufEnable highlight")
        end,
      }
    },
  }
else
  return {}
end
