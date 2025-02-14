vim.g.maplocalleader = "\\"

-- normal mode
-- run the line at the cursor
vim.keymap.set("n", "<localleader>x", "<cmd>.lua<CR>", { noremap = true, silent = true })
-- run the entire file
vim.keymap.set("n", "<localleader><localleader>x", "<cmd>source %<CR>", { noremap = true, silent = true })

-- in visual mode run the selected lines
vim.keymap.set("v", "<localleader>x", ":lua<CR>", { noremap = true, silent = true })
