local options = {
  -- set line numbers
  number = true,
  -- show the command that's being entered
  showcmd = true,
  -- make tab expand to spaces
  expandtab = true,
  -- number of columns an existing <TAB> will occupy
  tabstop = 2,
  -- when indenting with '>', use 2 column width
  shiftwidth = 2,
  -- pressing tab inserts 2 columns
  softtabstop = 2,
  -- make indentation a multiple of shiftwidth always
  shiftround = true,

  -- more comfortable splits
  splitbelow = true,
  splitright = true,

  -- makes the cursor remain in the middle of the page
  scrolloff = 999,

  -- make vim remember a lot
  history = 1000
}


for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.nvim_tree_show_icons = false
