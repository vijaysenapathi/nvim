local options = {
  number = true,        -- set line numbers
  cursorline = true,    -- highlight current line

  showcmd = true,       -- show the command that's being entered

  expandtab = true,     -- make tab expand to spaces
  tabstop = 2,          -- number of columns an existing <TAB> will occupy
  shiftwidth = 2,       -- when indenting with '>', use 2 column width
  softtabstop = 2,      -- pressing tab inserts 2 columns
  shiftround = true,    -- make indentation a multiple of shiftwidth always

  splitbelow = true,    -- more comfortable splits
  splitright = true,    -- more comfortable splits

  scrolloff = 999,      -- makes the cursor remain in the middle of the page

  history = 1000,       -- make vim remember a lot

  showmatch = true,     -- Show matching bracket
  matchtime = 15,       -- Matching bracket show time

  smartcase = true,     -- Handles case insensitive case searches properly

  -- TODO: move this to user settings
  shell = "/opt/homebrew/bin/fish", -- default shell to fish

  exrc = true,           -- Enabling project specific configuration to be set
  secure = true         -- disabling random shell scripts to be run from files
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
