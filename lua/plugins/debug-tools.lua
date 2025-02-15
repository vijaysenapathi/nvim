-- tools for debugging during plugin development
-- source: https://github.com/vijaysenapathi/nvim-debug-tools

return {
  "vijaysenapathi/nvim-debug-tools",
  name = "debug-tools", enable = false,
  config = function ()
    require("debug-tools").setup({})
  end
}
