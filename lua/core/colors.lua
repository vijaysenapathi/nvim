

-- set background transparent
-- vim.api.nvim_set_hl(0, "Normal", {guibg=nil, guifg=nil})
--

-- Makes floating windows background be normal
vim.api.nvim_set_hl(0, "NormalFloat", {link = "Normal"})
vim.api.nvim_set_hl(0, "FloatBorder", {link = "Normal"})

