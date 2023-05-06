require("toggleterm").setup({
  direction = "float",
  shade_terminals = false
})

vim.keymap.set("n", "<F12>", ":ToggleTerm<CR>")
