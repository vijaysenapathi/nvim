require("zen-mode").setup({
  window = {
    backdrop = 1,
    width = 80,
    height = 0.9,
    options = {
      number = false
    }
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
  }
})

vim.keymap.set("n", "<F5>", ":ZenMode<CR>:<C-c>")
