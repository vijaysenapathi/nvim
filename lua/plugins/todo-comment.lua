-- enables highlighting of todo comments
-- source: https://github.com/folke/todo-comments.nvim

return {
  "folke/todo-comments.nvim", name = "todo-comments",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
