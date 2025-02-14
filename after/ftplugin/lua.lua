vim.g.maplocalleader = "\\"

-- in normal mode run the line at the cursor
vim.keymap.set("n", "<localleader>x", "<cmd>.lua<CR>", { noremap = true, silent = true })

-- in visual mode run the selected lines
vim.keymap.set("v", "<localleader>x", "<cmd>\'<,\'>lua<CR>", { noremap = true, silent = true })
