
-- TODO: understand and comment what the below two are for
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move to the left"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move to the right"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move up"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move down"<CR>')

