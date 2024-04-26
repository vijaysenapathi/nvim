require("nvim-treesitter.configs").setup({
  -- list of parser names
  ensure_installed = "all",
  -- ensure_installed = { "c", "cpp", "cmake", "lua", "python", "rust", "vim" },
  ignore_install = {},

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
    disable = {
      "yaml" -- yaml indentation is broken with treesitter
    }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
})

