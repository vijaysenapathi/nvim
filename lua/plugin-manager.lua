-- Setting up the plugin manager, Lazy
-- Plugin source: https://github.com/folke/lazy.nvim
-- Installation reference: https://lazy.folke.io/installation

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- this would check for files inside plugins folder
    { import = "plugins" },
  },
  -- TODO: enable this later?
  -- automatically check for plugin updates
  -- checker = { enabled = true },
  -- TODO: enable this later?
  change_detection = { enabled = false },
  install = {
    -- colorscheme that'll be used when installing plugins
    colorscheme = { "catppuccin-macchiato", "habamax" }
  },
  -- automatically check for plugin updates
  checker = { enabled = false }
})

-- TODO: figure out an intro screen
