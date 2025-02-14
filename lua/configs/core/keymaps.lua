vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- TODO: understand and comment what the below two are for
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")


-- Shortcuts for switching through buffers
-- Use tab and shift tab in normal mode to switch buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")


-- Shortcuts for switching through tabs
-- All of them start with <leader>t, t for tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>") -- create a new tab
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>") -- move to right tab
vim.keymap.set("n", "<leader>th", ":tabprev<CR>") -- move to left tab
vim.keymap.set("n", "<leader>tl", ":tabs<CR>") -- show tabs list
vim.keymap.set("n", "<leader>tH", ":tabmove -<CR>") -- move the current tab to the left
vim.keymap.set("n", "<leader>tL", ":tabmove +<CR>") -- move the current tab to the right
vim.keymap.set("n", "<leader>t0", ":tabmove 0<CR>") -- move the current tab to the first
vim.keymap.set("n", "<leader>t$", ":tabmove $<CR>") -- move the current tab to the last
