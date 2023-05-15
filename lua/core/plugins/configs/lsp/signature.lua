require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = {"┌", "─" ,"┐","│", "┘", "─", "└", "│"},
  },
  hint_enable = false,
  hint_prefix = " ",
  hint_scheme = "Comment",
  hi_parameter = "IncSearch"
})


