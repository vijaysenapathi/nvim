require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = { width = 0.9, height = 0.9 },
    borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    border = true
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-P>", builtin.find_files, {})
--vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-F>", builtin.live_grep, {})
--vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

