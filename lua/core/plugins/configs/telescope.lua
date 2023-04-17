require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { width = 0.99, height = 0.99 }
  },
  pickers = {
    find_files = {
      borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}
    }
  }
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-P>", builtin.find_files, {})
--vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
