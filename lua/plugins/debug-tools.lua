-- tools for debugging during plugin development
--

return {
  dir = "~/Projects/Personal/nvim-debug-tools",
  name = "debug-tools",
  config = function ()
    require("debug-tools").setup({})
  end
}
