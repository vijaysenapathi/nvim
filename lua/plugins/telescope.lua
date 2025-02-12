-- for quick searching and opening files across the working directory
-- source: https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  name = "telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = { width = 0.9, height = 0.9 },
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        border = true,
        prompt_prefix = " 󰁕 ",
        selection_caret = " 󰄾 ",
        entry_prefix = "   ",
      }
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-P>", builtin.find_files, {})
    -- vim.keymap.set("n", "<S-F>", builtin.grep_string, {})
    vim.keymap.set("n", "<C-F>", builtin.live_grep, {})
    -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end
}
