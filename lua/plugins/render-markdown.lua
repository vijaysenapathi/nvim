-- better rendering of markdown within neovim
-- source: https://github.com/MeanderingProgrammer/render-markdown.nvim


return {
    "MeanderingProgrammer/render-markdown.nvim", name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {},
}
