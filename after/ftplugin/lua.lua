vim.g.maplocalleader = "\\"

-- in normal mode run the line at the cursor
vim.keymap.set("n", "<localleader>x",
function ()
  local line = vim.fn.getline(".")
  local command = "lua " .. line
  print(command)
  vim.cmd(command)
end,
{ noremap = true, silent = false }
)

-- in visual mode run the selected lines
vim.keymap.set("v", "<localleader>x", ":lua<CR>", { noremap = true, silent = true })
