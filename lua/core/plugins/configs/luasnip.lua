local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/core/snippets"})

ls.config.set_config({
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
