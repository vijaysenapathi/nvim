-- for adding custom snippets and for auto complete snippets to work
-- source: https://github.com/L3MON4D3/LuaSnip


return {
  "L3MON4D3/LuaSnip", name = "luasnip", version = "v2.3",
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_lua").load({paths = {"~/.config/nvim/lua/core/snippets"}})

    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = {
            virt_text = {{"X", "Red"}}
          }
        }
      }
    })
  end
}
