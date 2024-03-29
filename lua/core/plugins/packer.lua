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
  -- Base packer plugin
  use "wbthomason/packer.nvim"

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

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
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- syntax highlighting
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"

  -- better terminal
  use "akinsho/toggleterm.nvim"

  -- Language Server Protocol
  use "neovim/nvim-lspconfig"

  -- Symbols
  use 'simrat39/symbols-outline.nvim'

  -- Debug Protocol
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  -- use "mfussenegger/nvim-dap-python"

  -- Managing lsp servers and dap adapters
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  }

  use "ray-x/lsp_signature.nvim" -- Shows lsp definition

  -- auto complete
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "onsails/lspkind.nvim" -- For customizing suggestions

  use ({"L3MON4D3/LuaSnip", run = "make install_jsregexp"}) -- NVIM CMP requires a snippet engine
  use ({"saadparwaiz1/cmp_luasnip"})

  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-nvim-lsp" -- nvim builtin lsp
  use "hrsh7th/cmp-calc" -- some fun calculator completion
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- command line completion

  use "folke/neodev.nvim" -- for lua development

  -- Formatter
  use "mhartington/formatter.nvim"


  use "numToStr/Comment.nvim" -- Commenting
  use "windwp/nvim-autopairs" -- For auto pairing braces

  -- Git tools
  use "tpope/vim-fugitive"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- neorg
  use {
    "nvim-neorg/neorg",
    run = ":neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
  }

  -- Zen Mode
  use "folke/zen-mode.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

