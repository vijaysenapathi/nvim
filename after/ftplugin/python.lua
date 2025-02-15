vim.g.maplocalleader = "\\"

-- normal mode
-- TODO: run the line at the cursor

-- run the entire file
vim.keymap.set("n", "<localleader><localleader>x", "<cmd>!python %<CR>", { noremap = true, silent = true })

-- TODO: in visual mode run the selected lines
