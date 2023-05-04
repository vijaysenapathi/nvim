require("toggleterm").setup({
  direction = "float",
  shade_terminals = false
})

vim.keymap.set("n", "<C-T>", ":ToggleTerm<CR>")
