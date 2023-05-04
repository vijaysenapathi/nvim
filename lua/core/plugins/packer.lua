-- automatically make sure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- My plugins here
  -- use "foo1/bar1.nvim"
  -- use "foo2/bar2.nvim"

  -- colorschemes
  use "Mofiqul/dracula.nvim"
  use "arcticicestudio/nord-vim"
  use { "catppuccin/nvim", as = "catppuccin" }
  -- use "altercation/vim-colors-solarized"

  -- fancy icons
  use 'nvim-tree/nvim-web-devicons'
  -- file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons", opt=true }
  }

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  -- tab line
  use 'kdheepak/tabline.nvim'

  -- shows keyboard shortcuts
  use "folke/which-key.nvim"

  -- fuzzy searcher
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"

  -- better terminal
  use "akinsho/toggleterm.nvim"

  -- Language Server Protocol
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

--[[
  -- auto complete
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp" -- nvim builtin lsp
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  -- debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "mfussenegger/nvim-dap-python"
]]
  use "numToStr/Comment.nvim"

  -- Git tools
  use "tpope/vim-fugitive"

  -- For working well with tmux
  use "christoomey/vim-tmux-navigator"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

