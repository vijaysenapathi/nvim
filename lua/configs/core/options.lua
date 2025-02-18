local options = {
  -- set line numbers
  number = true,
  -- highlight current line
  cursorline = true,

  -- unnamed clipboard that gets used when normal yank is done will use
  -- the + register instead
  clipboard = "unnamedplus",

  -- show the command that's being typed
  showcmd = true,

  -- TODO: understand this better, it doesn't work
  -- visually show spaces when a line wraps
  breakindent = true,

  -- makes vim remember undoes even after closing vim by storing it
  -- in an 'undofile'
  undofile = true,

  -- makes tab expand to spaces
  expandtab = true,
  tabstop = 2,          -- number of columns an existing <TAB> will occupy
  shiftwidth = 2,       -- when indenting with '>', use 2 column width
  softtabstop = 2,      -- pressing tab inserts 2 columns
  shiftround = true,    -- make indentation a multiple of shiftwidth always

  -- how splits should be opened
  splitbelow = true,
  splitright = true,

  -- makes the cursor remain in the middle of the page
  scrolloff = 5,

  -- make vim remember a lot
  history = 1000,

  showmatch = true,     -- Show matching bracket
  matchtime = 15,       -- Matching bracket show time

  -- milliseconds after which the swap file gets updated without any writes
  updatetime = 250,

  -- milliseconds to wait for a mapped sequence to complete
  timeoutlen = 1000,

  -- case insensitive searching unless one or mode capital letters are in the
  -- search term
  ignorecase = true,
  smartcase = true,

  -- sets the shell path from the global settings
  shell = vim.g.shell or vim.env.SHELL,

  -- show tabs and trailing spaces as characters
  list = false,
  listchars = { tab = '>-<', trail = '-', nbsp = '+' },

  exrc = true,           -- Enabling project specific configuration to be set
  secure = true         -- disabling random shell scripts to be run from files
}

-- custom overrides if nerd fonts are available
if vim.g.nerd_font_enabled then
  options.listchars = { tab = ' ', trail = '󱁐', nbsp = '󰍴' }
end

for key, value in pairs(options) do
  vim.opt[key] = value
end
