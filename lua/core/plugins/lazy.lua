-- automatically ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the default map leader
-- See :help mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "


require("lazy").setup({

  { "vhyrro/luarocks.nvim", priority = 1000,  config = true },

  -- colorschemes
  { "catppuccin/nvim", name = "catppuccin" },

  -- fancy icons
  'nvim-tree/nvim-web-devicons',

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy=true }
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },

  -- tab line
  'kdheepak/tabline.nvim',

  -- shows keyboard shortcuts
  -- use "folke/which-key.nvim"

  -- fuzzy searcher
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- syntax highlighting
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",

  -- better terminal
  "akinsho/toggleterm.nvim",

  -- Language Server Protocol
  "neovim/nvim-lspconfig",

  -- Symbols
  'simrat39/symbols-outline.nvim',

  -- Debug Protocol
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  "rcarriga/nvim-dap-ui",
  -- use "mfussenegger/nvim-dap-python"

  -- Managing lsp servers and dap adapters
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },

  "ray-x/lsp_signature.nvim", -- Shows lsp definition

  -- auto complete
  "hrsh7th/nvim-cmp", -- The completion plugin
  "onsails/lspkind.nvim", -- For customizing suggestions

  ({"L3MON4D3/LuaSnip", build = "make install_jsregexp"}), -- NVIM CMP dependencies a snippet engine
  ({"saadparwaiz1/cmp_luasnip"}),

  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-nvim-lsp", -- nvim builtin lsp
  "hrsh7th/cmp-calc", -- some fun calculator completion
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- command line completion

  "folke/neodev.nvim", -- for lua development

  -- Formatter
  "mhartington/formatter.nvim",


  "numToStr/Comment.nvim", -- Commenting
  "windwp/nvim-autopairs", -- For auto pairing braces

  -- Git tools
  "tpope/vim-fugitive",
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({ load = {} })
    end,
  },

  -- neorg
  -- use {
  --   "nvim-neorg/neorg",
  --   run = ":neorg sync-parsers",
  --   dependencies = "nvim-lua/plenary.nvim"
  -- }
  -- use {
  --   "nvim-neorg/neorg",
  --   rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
  --   tag = "*",
  --   config = function()
  --       require("neorg").setup()
  --   end,
  -- }
  -- use {
  --   "nvim-neorg/neorg",
  --   rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
  --   tag = "*", -- Pin Neorg to the latest stable release
  --   config = function()
  --     require("neorg").setup()
  --   end,
  -- }

  -- Zen Mode
  "folke/zen-mode.nvim"

})

