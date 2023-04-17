vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  renderer = {
        indent_markers = {
        enable = true,
      },
    icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          git = false,
        }
    }
  }
})

vim.keymap.set("n", "<F1>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<F13>", ":NvimTreeFocus<CR>") -- Shift F1
