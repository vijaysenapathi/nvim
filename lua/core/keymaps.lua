vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use tab and shift tab in normal mode to switch buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

